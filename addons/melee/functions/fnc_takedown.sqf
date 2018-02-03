/*
 * Author: 0dr
 * Handles takedown
 *
 * Arguments:
 * 0: Caller <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin] call ACE_meele_takedon.sqf
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_caller", "_target"];

_config = nil;
//determin animationset
switch (true) do {
    case (((stance _caller) == "STAND") && ((stance _target ) == "STAND")): {
        _config = selectRandom  ("true" configClasses (configFile >> QGVAR(Animations) >> QGVAR(grabStandStand)));
        TRACE_1("",_config);
        _config = [QGVAR(grabStandStand),configName _config];
    };
    case (((stance _caller) == "CROUCH") && ((stance _target ) == "STAND")): {
        _config = selectRandom ("true" configClasses (configFile >> QGVAR(Animations) >> QGVAR(grabCrouchStand)));
        TRACE_1("",_config);
        _config = [QGVAR(grabCrouchStand),configName _config];
    };
    case (((stance _caller) == "CROUCH") && ((stance _target ) == "CROUCH")): {
        _config = selectRandom ("true" configClasses (configFile >> QGVAR(Animations) >> QGVAR(grabCrouchCrouch)));
        TRACE_1("",_config);
        _config = [QGVAR(grabCrouchCrouch),configName _config];
    };
    case (((stance _caller) == "STAND") && ((stance _target ) == "CROUCH")): {
        _config = selectRandom ("true" configClasses (configFile >> QGVAR(Animations) >> QGVAR(grabStandCrouch)));
        TRACE_1("",_config);
        _config = [QGVAR(grabStandCrouch),configName _config];
    };
    case (((stance _caller) == "CROUCH") && ((stance _target ) == "PRONE")): {
        _config = selectRandom ("true" configClasses (configFile >> QGVAR(Animations) >> QGVAR(grabCrouchProne)));
        TRACE_1("",_config);
        _config = [QGVAR(grabCrouchProne),configName _config];
    };

};
if (isNil "_config") exitWith {LOG("COULDNT FIND A PROPPER ANIMATION");};
TRACE_1("output",_config);
//inform target of beein taken down
if (local _target) then {
    //if it's local play everything in one
    [QGVAR(takedown),[_caller,_target,_config]] call CBA_fnc_localEvent;
} else {
    [QGVAR(takedown),[_caller,_target,_config],_target] call CBA_fnc_targetEvent;
    [QGVAR(takedown),[_caller,_target,_config]] call CBA_fnc_localEvent;
};













//
