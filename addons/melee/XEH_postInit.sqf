#include "script_component.hpp"

#include "initKeybinds.sqf"

if (!hasInterface) exitWith {};


//  //Eventhandler

[QGVAR(takedown), {
    params ["_caller","_target","_config"];
    //TRACE_2("grapped EH",_caller,_config);
    [_caller,_target,_config] call FUNC(takedownLocal);
}] call CBA_fnc_addEventHandler;

[QGVAR(melee), {
    params ["_caller","_target","_config"];
    //TRACE_2("grapped EH",_caller,_config);
    [_caller,_target,_config] call FUNC(meleeLocal);
}] call CBA_fnc_addEventHandler;


//
GVAR(fighting) = false;
