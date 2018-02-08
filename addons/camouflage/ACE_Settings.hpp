class ACE_Settings {
    // Enable the user to switch camo
    class GVAR(enabled) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(enabled_DisplayName);
        description = CSTRING(enabled_Description);
        typeName = "BOOL";
        value = 0;
    };
    // Reallistic change conditions (player has to be near the propper tarning material to change) (display?)
    class GVAR(reallistic) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(enabled_DisplayName);
        description = CSTRING(enabled_Description);
        typeName = "BOOL";
        value = 0;
    };
    // Unlock harsch uniform switch
    class GVAR(harsh) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(enabled_DisplayName);
        description = CSTRING(enabled_Description);
        typeName = "BOOL";
        value = 0;
    };
};
