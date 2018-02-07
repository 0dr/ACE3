/*
 * Author: 0dr
 * Handles treatment via surgical kit per frame
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *  0: Caller <OBJECT>
 *  1: Target <OBJECT>
 * 1: Elapsed Time <NUMBER>
 * 2: Total Time <NUMBER>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Example:
 * [[bob, kevin], 5, 5] call ACE_medical_fnc_treatmentAdvanced_surgicalKit_onProgress
 *
 * Public: No
 */
#include "script_component.hpp"

params["_caller",["_type","punch"]];
_target = cursorTarget;
_currentWeapon = currentWeapon _caller;
_config = nil;
_animationParentName = "";

//find right animation
switch (true) do {
    case (_currentWeapon == ""): {
        if (_type == "punch") then {
            _animationParentName = QGVAR(punchNone);
        }else{
            _animationParentName = QGVAR(kickNone);
        };
    };
    case (_currentWeapon == handgunWeapon player): {
        if (_type == "punch") then {
            _animationParentName = QGVAR(punchPistol);
        }else{
            _animationParentName = QGVAR(kickPistol);
        };
    };
    case (_currentWeapon == primaryWeapon player): {
        if (_type == "punch") then {
            _animationParentName = QGVAR(punchRifle);
        }else{
            _animationParentName = QGVAR(kickRifle);
        };
    };
    case (_currentWeapon == secondaryWeapon player): {
        if (_type == "punch") then {
            _animationParentName = QGVAR(punchLauncher);
        }else{
            _animationParentName = QGVAR(kickLauncher);
        };
    };
};
_config = selectRandom  ("true" configClasses (configFile >> QGVAR(Animations) >> _animationParentName));
TRACE_1("",_config);
_config = [_animationParentName,configName _config];


if (isNil "_config") exitWith {LOG("COULDNT FIND A PROPPER ANIMATION");};
TRACE_1("output",_config);
//inform target of beein taken down
if (local _target) then {
    //if it's local play everything in one
    [QGVAR(melee),[_caller,_target,_config]] call CBA_fnc_localEvent;
} else {
    [QGVAR(melee),[_caller,_target,_config],_target] call CBA_fnc_targetEvent;
    [QGVAR(melee),[_caller,_target,_config]] call CBA_fnc_localEvent;
};
