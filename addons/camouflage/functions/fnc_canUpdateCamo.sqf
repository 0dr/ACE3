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


//
params ["_caller", "_target", "_targetCamoType"];

//
if (isNil '_caller' || isNil '_target'|| isNil '_targetCamoType' || {_targetCamoType == ""}) exitWith {false};

// skip for identical camo
_skip = false;
_uniform = uniform _target;
switch (_targetCamoType) do {

    case "ARID": {
        if (_uniform find "_ard"> -1) then {_skip = true}
    };
    case "SEMIARID" : {
        if (_uniform find "_sard"  > -1) then {_skip = true}
    };
    case "LUSH": {
        if (_uniform find "_lsh" > -1) then {_skip = true}
    };
    case "JUNGLE": {
        if (_uniform find "_tna" > -1) then {_skip = true}
    };
    default {_skip = false};
};
TRACE_1("",_skip);
if (_skip) exitWith {false};

if (!GVAR(reallistic)) exitWith {
    TRACE_1("No check needed",GVAR(reallistic));
    true
};

//
TRACE_1("",_targetCamoType);
_pos = position _target;
_list = [];
_radius = 4;
_step = 90;
_return = false;
for "_i" from 0 to  360 Step _step do {
	_newPos = _pos vectorAdd [_radius * cos _i,_radius * sin _i,0];
    _surfaceType = surfaceType _newPos;
    _surfaceType = _surfaceType select [1,count _surfaceType -1];
    if !(_surfaceType in _list) then {
        _list pushBack _surfaceType;
        _camo = getArray ( configFile >> "CfgSurfaces" >> _surfaceType >> "availableCamo");
        TRACE_2("",_surfaceType,_camo);
    	if (_targetCamoType in _camo) exitWith {
            TRACE_1("available camo is present ",_surfaceType);
            _return = true;
        };
    };
    if (_return) exitWith {};
};
TRACE_1("",_return);
// if we cant update to what we want but we want an intermediat type check for the missing dif
if (!_return && _targetCamoType == "SEMIARID") then {
    _intermediateType = "";
    switch (true) do {
        case ( (uniform _target find "lsh") >-1): {
            _intermediateType = "ARID";
        };
        case ( (uniform _target find "ard")  >-1): {
            _intermediateType = "LUSH";
        };
    };
    TRACE_1("checking for intermediate types",_intermediateType);
    if !(_intermediateType == "") then {
        _return = [_caller, _target, _intermediateType] call FUNC(canUpdateCamo);
    };
};
TRACE_1("final",_return);
_return
/*
// VANILLA

ARID

#GdtGrassDry
#GdtMarsh
#GdtThorn

LUSH

#GdtGrassGreen
#GdtForestMalden   // ~~meh~~
#GdtWildField
#GdtGrassShort
#GdtGrassTall

SEMI ARID

#GdtDirt // ON ALTIS // nicht genug für lush
#GdtForestPine // ON ALTIS // nicht genug für lush

JUNGLE

#GdtForest
#GdtGrassTall

// CUP


ARID

#CrField2

#TKHlina
#TKTrava
#TKSkalniSterk

LUSH

#CrGrass
#CrGrass1
#CrGrass2
#CrForest1
#CrForest2
#CrGrassW1
#CrHLina // ?!?! maybe not

#TKPole
#TKForest

//Sharani
#GrassSouth
#Grass
#ForestNeedles
#ForestLeaves

#cwa_edenforest_surface
#cwa_edengrass_surface

SEMI ARID

#TKTrava
#TKMoutain

JUNGLE




//
