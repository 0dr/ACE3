/*
 * Author: commy2
 *
 * Called by repair action / progress bar. Raise events to set the new hitpoint damage.
 *
 * Arguments:
 * Stuff from progress bar.
 *
 * Return Value:
 * NONE
 */
#include "script_component.hpp"

private ["_unit", "_vehicle", "_hitPoint", "_wheel"];

_unit = _this select 0;
_vehicle = _this select 1;
_hitPoint = _this select 2;
_wheel = _this select 3;

// get current hitpoint damage
private "_hitPointDamage";
_hitPointDamage = _vehicle getHitPointDamage _hitPoint;

// can't replace not destroyed wheel
if (_hitPointDamage < 1) exitWith {};

// don't die by spawning / moving the wheel
_hitPointDamage = damage _wheel;

// can't replace a destroyed wheel
if (_hitPointDamage >= 1) exitWith {};

deleteVehicle _wheel;

// raise event to set the new hitpoint damage
["setWheelHitPointDamage", _vehicle, [_vehicle, _hitPoint, _hitPointDamage]] call EFUNC(common,targetEvent);

// display text message if enabled
if (GVAR(DisplayTextOnRepair)) then {
    [localize "STR_ACE_Repair_ReplacedWheel"] call EFUNC(common,displayTextStructured);
};
