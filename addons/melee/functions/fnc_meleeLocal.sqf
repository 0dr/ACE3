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
 * None
 *
 * Example:
 *
 *
 * Public: No
 */
#include "script_component.hpp"

_maxDistanceToTarget = 2.5;

params ["_caller","_target","_config"];
TRACE_3("",_caller,_target,_config);
GVAR(fighting) = true;
_config = (configFile >> QGVAR(Animations) >> (_config select 0) >> (_config select 1));
TRACE_2("",_caller,_config);

if ((_caller distance _target <= _maxDistanceToTarget) && local _target) then { //Magic var
    // Play Hit Sound
        playSound3D [selectRandom getArray (_config >> ""), _target];
    //
    _unitMeleeSkill = _caller getVariable [QGVAR(meleeSkill),1];
    _unitDisarmSkill = _caller getVariable [QGVAR(disarmSkill),1];
    TRACE_2("",_unitMeleeSkill,_unitDisarmSkill);

    //Chance to lose drop weapon
    if (GVAR(weaponDropToggle) && random(1) < (getNumber (_config >> "dropWeaponChance") * _unitDisarmSkill) ) then {
        [_caller, _target] call FUNC(dropWeapon);
    };

    _damage = (getNumber (_config >> "damage") * GVAR(knockoutMultiplyer) * _unitMeleeSkill / 2);
    TRACE_1("damage / 2", _damage);

    _targetKnockoutState = (_target getVariable [QGVAR(knockout),0]) + (_damage + random(_damage));
    // Exit if threashold is not met AND we actually care about knockout
    if (!GVAR(meleeLethalToggle) && _targetKnockoutState < 1) exitWith {
        TRACE_2("exit smaller 1",_targetKnockoutState, GVAR(meleeLethalToggle));
        _target setVariable [QGVAR(knockout), _targetKnockoutState];
    };

    // else
    [
        {
            params["_configValue","_target"];
            TRACE_1("CBA wait and execute",_this);
            GVAR(fighting) = false;
            if !(alive _target) exitWith {TRACE_1("exit WaE, target is not alive",_target)};

            //TO-DO:  Allwo for different hits
            _hit = "body";
            //
            if (GVAR(meleeLethalToggle)) then {
                //_target setDamage _configValue;
                [_target, _configValue,_hit,"punch"] call EFUNC(medical,addDamageToUnit);
            }else{
                if (GVAR(wakeBackUp) >= (if (isPlayer _target) then [{1},{2}])) then {
                    [_target, true, GVAR(knockOutTimer), true] call ace_medical_fnc_setUnconscious;
                }else{
                    [_target, true] call FUNC(setUnconsciousAI);
                };
            };
        },
        [_damage * 2,_target],
        getNumber (_config >> "time") max 1
    ] call CBA_fnc_waitAndExecute;
    TRACE_1("local _target","");
};
if (local _caller) then {
    // Play Swing Sound
        //playSound3D
    // play other animation //local is target and caller switched lol
    _animation = getText (_config >> "animation");
    TRACE_1("local _caller",_animation);
    _caller playActionNow _animation;
    // Reset fight state
    [
        {
            GVAR(fighting) = false;
        },
        [],
        getNumber (_config >> "time") max 1
    ] call CBA_fnc_waitAndExecute;

};



//
