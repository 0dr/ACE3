/*
 * Author: commy2
 *
 * Called from init eventhandler. Checks if the vehicles class already has the actions initialized. Otherwise add all available repair options.
 *
 * Arguments:
 * 0: vehicle (Object)
 *
 * Return Value:
 * NONE
 */
#include "script_component.hpp"

private "_vehicle";

_vehicle = _this select 0;

private ["_type", "_initializedClasses"];

_type = typeOf _vehicle;

_initializedClasses = GETMVAR(GVAR(initializedClasses),[]);

// do nothing if the class is already initialized
if (_type in _initializedClasses) exitWith {};

// get all hitpoints
private "_hitPoints";
_hitPoints = [_vehicle] call EFUNC(common,getHitPointsWithSelections) select 0;

// get hitpoints of wheels with their selections
private ["_wheelHitPointsWithSelections", "_wheelHitPoints", "_wheelHitPointSelections"];

_wheelHitPointsWithSelections = [_vehicle] call FUNC(getWheelHitPointsWithSelections);

_wheelHitPoints = _wheelHitPointsWithSelections select 0;
_wheelHitPointSelections = _wheelHitPointsWithSelections select 1;

// add repair events to this vehicle class
{
    if (_x in _wheelHitPoints) then {
        // add wheel repair action

        private ["_icon", "_selection"];

        _nameRemove = format ["Remove_%1", _x];

        _icon = QUOTE(PATHTOF(ui\tire_ca.paa));

        _selection = _wheelHitPointSelections select (_wheelHitPoints find _x);

        private ["_name", "_text", "_condition", "_statement"];

        // remove wheel action
        _name = format  ["Remove_%1", _x];
        _text = localize "STR_ACE_Repair_RemoveWheel";

        _condition = {[_this select 1, _this select 0, _this select 2 select 0] call DFUNC(canRemoveWheel)};
        _statement = {[_this select 1, _this select 0, _this select 2 select 0] call DFUNC(removeWheel)};

        private "_action";
        _action = [_name, _text, _icon, _statement, _condition, {}, [_x], _selection, 2] call EFUNC(interact_menu,createAction);
        [_type, 0, [], _action] call EFUNC(interact_menu,addActionToClass);

        // replace wheel action
        _name = format  ["Replace_%1", _x];
        _text = localize "STR_ACE_Repair_ReplaceWheel";

        _condition = {[_this select 1, _this select 0, _this select 2 select 0] call DFUNC(canReplaceWheel)};
        _statement = {[_this select 1, _this select 0, _this select 2 select 0] call DFUNC(replaceWheel)};

        _action = [_name, _text, _icon, _statement, _condition, {}, [_x], _selection, 2] call EFUNC(interact_menu,createAction);
        [_type, 0, [], _action] call EFUNC(interact_menu,addActionToClass);

    } else {
        // exit if the hitpoint is in the blacklist, e.g. glasses
        if (_x in IGNORED_HITPOINTS) exitWith {};

        // exit if the hitpoint is virtual
        if (isText (configFile >> "CfgVehicles" >> _type >> "HitPoints" >> _x >> "depends")) exitWith {};

        // add misc repair action

        private ["_name", "_text", "_icon", "_selection", "_condition", "_statement"];

        _name = format ["Repair_%1", _x];

        _text = format ["STR_ACE_Repair_%1", _x];

        if (isLocalized _text) then {
            _text = format [localize "STR_ACE_Repair_RepairHitpoint", localize _text];
        } else {
            _text = format [localize "STR_ACE_Repair_RepairHitpoint", _x];
        };

        _icon = "";
        _selection = "";

        _condition = {[_this select 1, _this select 0, _this select 2 select 0] call DFUNC(canRepair)};
        _statement = {[_this select 1, _this select 0, _this select 2 select 0] call DFUNC(repairVehicle)};

        private "_action";
        _action = [_name, _text, _icon, _statement, _condition, {}, [_x], _selection, 4] call EFUNC(interact_menu,createAction);
        [_type, 0, ["ACE_MainActions", QGVAR(Repair)], _action] call EFUNC(interact_menu,addActionToClass);

    };
} forEach _hitPoints;

// set class as initialized
_initializedClasses pushBack _type;

SETMVAR(GVAR(initializedClasses),_initializedClasses);
