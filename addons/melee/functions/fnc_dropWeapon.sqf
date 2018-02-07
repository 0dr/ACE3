#include "script_component.hpp"

params["_caller","_target"];
if (currentWeapon _target == "") exitWith {};
_holder = createVehicle ["GroundWeaponHolder", position _target, [], 0, "CAN_COLLIDE"];
_target action ["DropWeapon",_holder,currentWeapon _target];
