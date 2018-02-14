/*
 * Author: 0dr
 * Add a listbox row.
 *
 * Arguments:
 * 0: Config category <STRING> (must be "CfgWeapons", "CfgVehicles", "CfgMagazines", "CfgVoice")
 * 1: Classname <STRING>
 * 2: Panel control <CONTROL>
 * 3: Name of the picture entry in that Cfg class <STRING>
 *
 * Return Value:
 * None
 *
 * Public: Yes
*/
#include "script_component.hpp"

params["_caller", "_target", "_camoType"];

_uniformItems = uniformItems _target;

if ((count _uniformItems) > 0) exitWith {
    ["Empty the uniform first!", true, 5, 1] call ace_common_fnc_displayText;
};

//
_uniform = uniform _target;
_time = if (_caller == _target) then {65} else {25};

TRACE_3("",_camoType,_uniform,_time);
switch (_camoType) do {

    case "ARID": {
        _camoType = "FullGhillie_ard";
        if (_uniform find "sard"> -1) then {_time = _time / 2};
    };
    case "SEMIARID" : {
        _camoType = "FullGhillie_sard";
        if (_uniform find "sard"  > -1 || _uniform find "ard" > -1) then {_time = _time / 2};
    };
    case "LUSH": {
        _camoType = "FullGhillie_lsh";
        if (_uniform find "sard" > -1) then {_time = _time / 2};
    };
    case "JUNGLE": {_camoType = "T_FullGhillie_tna_F"};
    default {_camoType = ""};
};
TRACE_2("",_camoType,_time);
if (_camoType == "") exitWith {};

//
//[_unit, "", 1] call EFUNC(common,doAnimation);

// Create progress bar
private _fnc_onFinish = {
    (_this select 0) params ["_unit","_camoType"];
    TRACE_2("ProgressBar",_unit,_camoType);
    // make new Uniform class
    _uniform = uniform _unit;
    _uniformNew = (_uniform select [0,4]) + _camoType;
    TRACE_1("",_uniformNew);
    // Change the classname accordingly
    _unit forceAddUniform _uniformNew;
    // Reset animation
    [_unit, "", 1] call EFUNC(common,doAnimation);
};
private _fnc_onFailure = {
    (_this select 0) params ["_unit"];
    // Reset animation
    [_unit, "", 1] call EFUNC(common,doAnimation);
};
[_time, [_target, _camoType], _fnc_onFinish, _fnc_onFailure, "Changing camo"] call EFUNC(common,progressBar);



// Items back into uniform
/*
{
    _caller addItemToUniform _x;
}forEach _uniformItems;
*/


//
