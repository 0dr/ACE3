/*
 * Author: commy2
 * Kills a local unit.
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: Reason for death <STRING>
 *
 * ReturnValue:
 * None
 *
 * Example:
 * [bob, "bloodloss"] call ace_medical_fnc_setDead;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", ["_reason", "unknown"]];

// kill
_unit setDamage 1;

// reset textures
[_unit, "All"] call EFUNC(medical_engine,updateBodyPartVisuals);

private _lastShooter = _unit getVariable [QEGVAR(medical_engine,lastShooter), objNull];
private _lastInstigator = _unit getVariable [QEGVAR(medical_engine,lastInstigator), objNull];

["ace_killed", [_unit, _reason, _lastShooter, _lastInstigator]] call CBA_fnc_globalEvent;
