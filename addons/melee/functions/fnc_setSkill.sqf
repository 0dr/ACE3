/*
 * Author: 0dr
 * Sets Unit skill for melee & disarm
 *
 * Arguments:
 * 0: Caller <OBJECT>
 * 1: Skill Level Melee <NUMBER>
 * 2: Skill Level Disarm <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, 2, 2] call ACE_melee_fnc_setSkill
 *
 * Public: Yes
 */
#include "script_component.hpp"

params["_caller","_melee","_disarm"];

// CHECK for LOCAL?

_caller setVariable [QGVAR(meleeSkill),_melee];
_caller setVariable [QGVAR(disarmSkill),_disarm];
