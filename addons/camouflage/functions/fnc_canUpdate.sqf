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
params["_caller","_target"];
//Preserve uniform items
//
_uniform = uniform _target;
TRACE_1("",_uniform);
_uniformStrip = _uniform select [3,count _uniform -1];
TRACE_1("",_uniformStrip);
if (_uniformStrip in GVAR(supported)) exitWith {
    true
};
false
