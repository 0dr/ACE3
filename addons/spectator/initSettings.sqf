[
    QGVAR(filterUnits),
    "LIST",
    [LSTRING(units_DisplayName), LSTRING(units_Description)],
    LSTRING(SettingsCategory),
    [
        [0,1,2,3],
        [LSTRING(units_none), LSTRING(units_players), LSTRING(units_playable), LSTRING(units_all)],
        2
    ],
    true,
    FUNC(updateUnits)
] call CBA_Settings_fnc_init;

[
    QGVAR(filterSides),
    "LIST",
    [LSTRING(sides_DisplayName), LSTRING(sides_Description)],
    LSTRING(SettingsCategory),
    [
        [0,1,2,3],
        [LSTRING(sides_player), LSTRING(sides_friendly), LSTRING(sides_hostile), LSTRING(sides_all)],
        0
    ],
    true,
    FUNC(updateUnits)
] call CBA_Settings_fnc_init;

[
    QGVAR(restrictModes),
    "LIST",
    [LSTRING(modes_DisplayName), LSTRING(modes_Description)],
    LSTRING(SettingsCategory),
    [
        [0,1,2,3,4],
        [LSTRING(modes_all), LSTRING(modes_unit), LSTRING(modes_free), LSTRING(modes_internal), LSTRING(modes_external)],
        0
    ],
    true,
    FUNC(transitionCamera)
] call CBA_Settings_fnc_init;

[
    QGVAR(restrictVisions),
    "LIST",
    [LSTRING(visions_DisplayName), LSTRING(visions_Description)],
    LSTRING(SettingsCategory),
    [
        [0,1,2,3],
        [LSTRING(modes_all), LSTRING(visions_nv), LSTRING(visions_ti), localize "STR_Special_None"],
        0
    ],
    true,
    FUNC(transitionCamera)
] call CBA_Settings_fnc_init;