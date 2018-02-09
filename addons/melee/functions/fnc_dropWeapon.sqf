#include "script_component.hpp"

params["_caller","_target"];
if (currentWeapon _target == "") exitWith {};
_holder = createVehicle ["GroundWeaponHolder", position _target, [], 0, "CAN_COLLIDE"];
_holder setPos position _target;
_target action ["DropWeapon",_holder,currentWeapon _target];



/*
if(count _weapons > 0) then {
    private ["_dummy", "_weapon"];
    _dummy = call fn_createEmptyUnit;

    {
        private ["_weapon"];
        _weapon = (_x select 0);
        _dummy addWeapon _weapon;
        {
            if(_forEachIndex > 0 && !(_x isEqualTo "") && !(_x isEqualTo [])) then {
                _dummy addWeaponItem [_weapon, _x];
            };
        }foreach _x;
        _dummy action [ "DropWeapon", _container, _weapon ];
    }foreach _weapons;

    //deleteVehicle _dummy;
};


[{
    params ["_args", "_pfID"];
    _args params ["_caller", "_target", "_listOfItemsToRemove", "_holder", "_holderIsEmpty", "_maxWaitTime", "_doNotDropAmmo", "_startingMagazines"];

    private _needToRemoveWeapon = ({_x in _listOfItemsToRemove} count (weapons _target)) > 0;
    private _needToRemoveMagazines = ({_x in _listOfItemsToRemove} count (magazines _target)) > 0;
    private _needToRemoveBackpack = ((backPack _target) != "") && {(backPack _target) in _listOfItemsToRemove};
    private _needToRemoveVest = ((vest _target) != "") && {(vest _target) in _listOfItemsToRemove};
    private _needToRemoveUniform = ((uniform _target) != "") && {(uniform _target) in _listOfItemsToRemove};

    if ((CBA_missionTime < _maxWaitTime) && {[_target] call FUNC(canBeDisarmed)} && {_needToRemoveWeapon || _needToRemoveMagazines || _needToRemoveBackpack}) then {
        //action drop weapons (keeps loaded magazine and attachements)
        {
            if (_x in _listOfItemsToRemove) then {
                _target action ["DropWeapon", _holder, _x];
            };
        } forEach (weapons _target);

        //Drop magazine (keeps unique ID)
        {
            if (_x in _listOfItemsToRemove) then {
                _target action ["DropMagazine", _holder, _x];
            };
        } forEach (magazines _target);

        //Drop backpack (Keeps variables for ACRE/TFR)
        if (_needToRemoveBackpack) then {_target action ["DropBag", _holder, (backPack _target)];};
    } else {
        [_pfID] call CBA_fnc_removePerFrameHandler;

        if (_doNotDropAmmo) then {
            private _error = false;

            private _magsToPickup = +_startingMagazines;
            {
                private _index = _magsToPickup find _x;
                if (_index == -1) exitWith {_error = true; ERROR("More mags than when we started?")};
                _magsToPickup deleteAt _index;
            } forEach (magazinesAmmo _target);

            private _magazinesInHolder = magazinesAmmoCargo _holder;
            {
                private _index = _magazinesInHolder find _x;
                if (_index == -1) exitWith {_error = true; ERROR("Missing mag not in holder")};
                _magazinesInHolder deleteAt _index;
            } forEach _magsToPickup;

            //No Error (all the ammo in the container is ammo we should have);
            if ((!_error) && {_magazinesInHolder isEqualTo []}) then {
                {
                    _target addMagazine _x;
                } forEach (magazinesAmmoCargo _holder);
                clearMagazineCargoGlobal _holder;
            };
        };

        //If we added a dummy item, remove it now
        if (_holderIsEmpty && {!((getItemCargo _holder) isEqualTo [[DUMMY_ITEM],[1]])}) exitWith {
            _holder setVariable [QGVAR(holderInUse), false];
            [_caller, _target, "Debug: Holder should only have dummy item"] call FUNC(eventTargetFinish);
        };
        if (_holderIsEmpty) then {
            TRACE_1("Debug: removing dummy item from holder",_holder);
            clearItemCargoGlobal _holder;
        };
        //Verify we didn't timeout waiting on drop action
        if (CBA_missionTime >= _maxWaitTime)  exitWith {
            _holder setVariable [QGVAR(holderInUse), false];
            [_caller, _target, "Debug: Drop Actions Timeout"] call FUNC(eventTargetFinish);
        };
        //If target lost disarm status:
        if (!([_target] call FUNC(canBeDisarmed))) exitWith {
            _holder setVariable [QGVAR(holderInUse), false];
            [_caller, _target, "Debug: Target cannot be disarmed"] call FUNC(eventTargetFinish);
        };
        if (_needToRemoveVest && {!((vestItems _target) isEqualTo [])}) exitWith {
            _holder setVariable [QGVAR(holderInUse), false];
            [_caller, _target, "Debug: Vest Not Empty"] call FUNC(eventTargetFinish);
        };
        if (_needToRemoveVest) then {
            _holder addItemCargoGlobal [(vest _target), 1];
            removeVest _target;
        };
        if (_needToRemoveUniform && {!((uniformItems _target) isEqualTo [])}) exitWith {
            _holder setVariable [QGVAR(holderInUse), false];
            [_caller, _target, "Debug: Uniform Not Empty"] call FUNC(eventTargetFinish);
        };
        if (_needToRemoveUniform) then {
            _holder addItemCargoGlobal [(uniform _target), 1];
            removeUniform _target;
        };

        _holder setVariable [QGVAR(holderInUse), false];
        [_caller, _target, ""] call FUNC(eventTargetFinish);
    };

}, 0.0, [_caller,_target, _listOfItemsToRemove, _holder, _holderIsEmpty, (CBA_missionTime + TIME_MAX_WAIT), _doNotDropAmmo, _targetMagazinesEnd]] call CBA_fnc_addPerFrameHandler;
/*
