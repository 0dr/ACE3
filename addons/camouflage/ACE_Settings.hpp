class ACE_Settings {
    // Enable the user to switch camo
    class GVAR(enabled) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(Enabled_DisplayName);
        description = CSTRING(Enabled_Description);
        typeName = "BOOL";
        value = 1;
    };
    // Reallistic change conditions (player has to be near the propper camo material to change) (display?)
    class GVAR(realistic) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(Realistic_DisplayName);
        description = CSTRING(Realistic_Description);
        typeName = "BOOL";
        value = 1;
    };
};
