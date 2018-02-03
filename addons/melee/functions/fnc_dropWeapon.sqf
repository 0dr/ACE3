#include "script_component.hpp"

params["_caller","_target"];

_holder = createVehicle ["GroundWeaponHolder", position _target, [], 0, "CAN_COLLIDE"];
_target action ["DropWeapon",_holder,currentWeapon _target];
