/*
 * Author: GitHawk
 * Returns true if the magazine is in the current supply
 *
 * Argument:
 * 0: Ammo Truck <OBJECT>
 * 1: Magazine Classname <STRING>
 *
 * Return value:
 * Magazine in supply <BOOL>
 *
 * Example:
 * [ammo_truck, "500Rnd_127x99_mag_Tracer_Red"] call ace_rearm_fnc_magazineInSupply
 *
 * Public: No
 */
#include "script_component.hpp"

params [
    ["_truck", objNull, [objNull]],
    ["_magazineClass", "", [""]]
];

if (isNull _truck ||
    {_magazineClass isEqualTo ""}) exitWith {false};

// With limited supply, we need to check supply
if (GVAR(supply) == 1) exitWith {_this call FUNC(hasEnoughSupply)};
// With magazine specific supply, we need to check them
if (GVAR(supply) == 2) exitWith {
    private _magazineSupply = _truck getVariable [QGVAR(magazineSupply), []];
    private _magazinePresent = false;
    {
        _x params ["_magazine", "_rounds"];
        if ((_magazine isEqualTo _magazineClass) && (_rounds > 0)) exitWith {_magazinePresent = true; };
        false
    } count _magazineSupply;
    _magazinePresent
};

// With infinite supply, the is always one left
true
