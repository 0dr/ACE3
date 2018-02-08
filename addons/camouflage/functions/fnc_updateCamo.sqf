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

params["_caller","_camoType"];
TRACE_1("",_camoType);
switch (_camoType) do {

    case "ARID": {_camoType = "FullGhillie_ard"};
    case "SEMIARID" : {_camoType = "FullGhillie_sard"};
    case "LUSH": {_camoType = "FullGhillie_lsh"};
    case "JUNGLE": {_camoType = "T_FullGhillie_tna_F"};
    default {_camoType = ""};
};
TRACE_1("",_camoType);
if (_camoType == "") exitWith {};
// make new Uniform class
_uniform = uniform _caller;
_uniformNew = (_uniform select [0,4]) + _camoType;
TRACE_1("",_uniformNew);
// Preserve uniform items
_uniformItems = uniformItems _caller;
// drop items because of unique stuff

// Change the classname accordingly
_caller forceAddUniform _uniformNew;
// Items back into uniform




//
