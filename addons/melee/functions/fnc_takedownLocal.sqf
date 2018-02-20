/*
 * Author: 0dr
 * Plays the Animation and applys damage to target
 *
 * Arguments:
 * 0: Caller <OBJECT>
 * 1: Arguments <ARRAY>
 *  0: ConfigParent <STRING>
 *  1: ConfigChild <STRING>
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

params ["_caller","_target","_config"];
TRACE_3("",_caller,_target,_config);

_config = (configFile >> QGVAR(Animations) >> (_config select 0) >> (_config select 1));
TRACE_2("",_caller,_config);
if (local _target) then {
    //drop weapon
    [_caller, _target] call FUNC(dropWeapon);

    // Attach yourself
    _target attachTo [_caller,[0,getNumber (_config >> "damageDistance"),0]];
    // prevent movement
    // play animation
    _target playActionNow (getText (_config >> "targetAnimation"));
    TRACE_1("",getText (_config >> "targetAnimation"));
    // play effects
    if (_target == ACE_player) then {
        addCamShake [6,3,80]; // Camshake
    };

    [QGVAR(choking_victim), position _caller] call EFUNC(common,playConfigSound3D);

    [
        {
            params["_configValue","_target"];
            TRACE_1("CBA wait and execute",_this);
            // detach
            detach _target;
            if !(alive _target) exitWith {};
            //Apply effect

            if (GVAR(takedownsLethalToggle)) then {
                [_target,1,"head","punch"] call EFUNC(medical,addDamageToUnit);
            }else {
                if (GVAR(wakeBackUp) >= (if (isPlayer _target) then [{1},{2}])) then {
                    [_target, true, GVAR(knockOutTimer), true] call ace_medical_fnc_setUnconscious;
                }else{
                    [_target, true] call FUNC(setUnconsciousAI);
                };
                //kill ai that wont recover cus cheaper on the game
                //_target setDamage _configValue;


            };
        },
        [getNumber (_config >> "damage"),_target],
        getNumber (_config >> "targetTime") max 1
    ] call CBA_fnc_waitAndExecute;
    TRACE_1("END",true);
};
if (local _caller) then {
    // play other animation //local is target and caller switched lol
    _caller setPos (_target modelToWorld [0, -(getNumber (_config >> "damageDistance")), 0]);
    _caller playActionNow getText (_config >> "animation");
    TRACE_1("FINAL",getText (_config >> "animation"));
    [QGVAR(choking_attacker), position _caller] call EFUNC(common,playConfigSound3D);

};



//
