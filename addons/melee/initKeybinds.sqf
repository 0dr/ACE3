

if (((name player) find "Finn Odrson") == -1) exitWith {INFO("These functions are currently user locked")};

//GRAB
["ACE3 Melee", QGVAR(takedownKey), localize LSTRING(takedownKey),
{
    // Conditions: canInteract
    if !(GVAR(takedownsToggle)) exitWith {TRACE_1("takeDown disabled",ace_melee_takedownsToggle)};
    private _target = cursorObject;
    if (!GVAR(allowBlufor) && (side _target == side ACE_player)) exitWith {LOG("Teamdamage disabled")};
    //if !([ACE_player, _target, []] call EFUNC(common,canInteractWith)) exitWith {false};
    if !(_target isKindOf "CAManBase") exitWith {TRACE_1("Target is not CAManBase",typeOf _target)};
    if ((_target distance ACE_player) > getNumber (configFile >> "CfgVehicles" >> "CAManBase" >> "ACE_Actions" >> "ACE_MainActions" >> QGVAR(takedown) >> "distance")) exitWith {TRACE_1("Distance too large",ACE_player distance _target)};
    if (((_target getRelDir player) > 225) ||(_target getRelDir player) < 135) exitWith {TRACE_1("Wrong angle",_target getRelDir player)};
    // Statement
    [ACE_player, _target] call FUNC(takedown);
    false
},
{false},
[0, [false, false, false]], false, 0] call CBA_fnc_addKeybind; // (empty default key)


//HIT
["ACE3 Melee", QGVAR(meleeKey), localize LSTRING(meleeKey),
{
    // Conditions: canInteract
    if !(ace_melee_meleeToggle) exitWith {TRACE_1("melee disabled",ace_melee_meleeToggle)};
    private _target = cursorObject;
    if (!GVAR(allowBlufor) && (side _target == side ACE_player)) exitWith {LOG("Teamdamage disabled")};
    // Statement
    [ACE_player] call FUNC(melee);
    false
},
{false},
[0, [false, false, false]], false, 0] call CBA_fnc_addKeybind; // (empty default key)
