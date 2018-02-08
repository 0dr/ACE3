#include "script_component.hpp"

if (!hasInterface) exitWith {};

//["ace_firedPlayer", DFUNC(throwEH)] call CBA_fnc_addEventHandler;
// ["ace_firedPlayerNonLocal", DFUNC(throwEH)] call CBA_fnc_addEventHandler;
// ["ace_firedNonPlayer", DFUNC(throwEH)] call CBA_fnc_addEventHandler;


//WHERE TO PUT FOR OTHER ADDONS TO EXTEND TO?
GVAR(supported) = [
    //BLUFOR
    "_FullGhillie_sard",
    "_FullGhillie_lsh",
    "_T_FullGhillie_tna_F",
    "_FullGhillie_ard"
];
