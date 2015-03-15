/*
 * Author: Hope Johnson and commy2
 * Puts in earplugs.
 *
 * Arguments:
 * 0:Unit (player) <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_player] call ace_hearing_fnc_putInEarplugs
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_player);

// Buds in inventory, putting them in
_player removeItem "ACE_EarBuds";

_player setVariable ["ACE_hasEarPlugsIn", true, true];

[localize "STR_ACE_Hearing_Earbuds_Are_On"] call EFUNC(common,displayTextStructured);

/*// No Ear Buds in inventory, telling user
[localize "STR_ACE_Hearing_NoBuds"] call EFUNC(common,displayTextStructured);*/
