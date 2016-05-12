/*
 * Author: GitHawk
 * Check whether enough supply is left to take the magazine.
 *
 * Argument:
 * 0: Ammo Truck <OBJECT>
 * 1: Magazine Classname <STRING>
 *
 * Return value:
 * Enough supply <BOOL>
 *
 * Example:
 * [ammo_truck, "500Rnd_127x99_mag_Tracer_Red"] call ace_rearm_fnc_hasEnoughSupply
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

// With infinite supply, there is always enough
if (GVAR(supply) == 0) exitWith {true};
// With magazine specific supply, we need to check stored magazines
if (GVAR(supply) == 2) exitWith {_this call FUNC(magazineInSupply)};

private _supply = [_truck] call FUNC(getSupplyCount);
([_magazineClass] call FUNC(getCaliber)) params ["_cal", "_idx"];

// With caliber based rearming, we only need partial supply
if (GVAR(level) == 2) exitWith {
    // If REARM_COUNT is bigger than the magazine size, we might get a bigger number than 1
    private _magazinePart = ((REARM_COUNT select _idx) / (getNumber (configFile >> "CfgMagazines" >> _magazineClass >> "count"))) min 1;
    (_cal * _magazinePart <= _supply)
};

(_cal <= _supply)
