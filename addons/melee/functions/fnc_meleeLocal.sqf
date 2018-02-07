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

_maxDistanceToTarget = 2.5;

params ["_caller","_target","_config"];
TRACE_3("",_caller,_target,_config);

_config = (configFile >> QGVAR(Animations) >> (_config select 0) >> (_config select 1));
TRACE_2("",_caller,_config);

if ((_caller distance _target <= _maxDistanceToTarget) && local _target) then { //Magic var

    //Chance to lose drop weapon //TRAIT BASED MULTIPLYER
    if (GVAR(weaponDropToggle) && random(1) < getNumber (_config >> "dropWeaponChance") ) then {
        [_caller, _target] call FUNC(dropWeapon);
    };

    _damage = (getNumber (_config >> "damage") * GVAR(knockoutMultiplyer) / 2); // LOCAL TRAIT BASED MULTIPLYER
    _targetKnockoutState = (_target getVariable [QGVAR(knockout),0]) + (_damage + random(_damage));

    // Exit if threashold is not met
    if (_targetKnockoutState < 1) exitWith {_target setVariable [QGVAR(knockout), _targetKnockoutState];};

    // else
    [
        {
            params["_configValue","_target"];
            TRACE_1("CBA wait and execute",_this);
            // detach
            //Apply effect

            if (GVAR(meleeLethalToggle)) then {
                _target setDamage _configValue;
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
    _caller playActionNow getText (_config >> "animation");
    TRACE_1("FINAL",getText (_config >> "animation"));

};



//
