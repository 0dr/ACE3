class ACE_Settings {
    class GVAR(takedownsToggle) {
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(takedownSettingName);
        description = CSTRING(takedownSettingDescription);
    };
    class GVAR(takedownsLethalToggle) {
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(takedownLethalSettingName);
        description = CSTRING(takedownLethalSettingDescription);
    };
    class GVAR(meleeToggle) {
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(meleeSettingName);
        description = CSTRING(meleeSettingDescription);
    };
    class GVAR(meleeLethalToggle) {
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(meleeLethalSettingName);
        description = CSTRING(meleeLethalSettingDescription);
    };
    class GVAR(allowBlufor) {
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(allowBluforName);
        description = CSTRING(allowBluforDescription);
    };
    class GVAR(knockOutTimer) {
        value = 20;
        typeName = "SCALAR";
        displayName = CSTRING(knockOutTimerName);
        description = CSTRING(knockOutTimerDescription);
        sliderSettings[] = {0, 10000, 20, 1};
    };
    class GVAR(wakeBackUp) {
        value = 1;
        typeName = "SCALAR";
        displayName = CSTRING(wakeBackUpName);
        description = CSTRING(wakeBackUpDescription);
        values[] = {"Disabled", "Only player","Everyone"};
    };
};
