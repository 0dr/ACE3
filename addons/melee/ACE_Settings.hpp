class ACE_Settings {
    class GVAR(takedownsToggle) {
        category = CSTRING(Category_Melee);
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(takedownSettingName);
        description = CSTRING(takedownSettingDescription);
    };
    class GVAR(takedownsLethalToggle) {
        category = CSTRING(Category_Melee);
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(takedownLethalSettingName);
        description = CSTRING(takedownLethalSettingDescription);
    };
    class GVAR(meleeToggle) {
        category = CSTRING(Category_Melee);
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(meleeSettingName);
        description = CSTRING(meleeSettingDescription);
    };
    class GVAR(meleeLethalToggle) {
        category = CSTRING(Category_Melee);
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(meleeLethalSettingName);
        description = CSTRING(meleeLethalSettingDescription);
    };
    class GVAR(allowTeamdamageTakedown) {
        category = CSTRING(Category_Melee);
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(allowTeamdamageTakedownSettingName);
        description = CSTRING(allowTeamdamageTakedownSettingDescription);
    };
    class GVAR(allowTeamdamageMelee) {
        category = CSTRING(Category_Melee);
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(allowTeamdamageMeleeSettingName);
        description = CSTRING(allowTeamdamageMeleeSettingDescription);
    };
    class GVAR(knockOutTimer) {
        category = CSTRING(Category_Melee);
        value = 20;
        typeName = "SCALAR";
        displayName = CSTRING(knockOutTimerSettingName);
        description = CSTRING(knockOutTimerSettingDescription);
        sliderSettings[] = {0, 10000, 20, 1};
    };
    class GVAR(wakeBackUp) {
        category = CSTRING(Category_Melee);
        value = 1;
        typeName = "SCALAR";
        displayName = CSTRING(wakeBackUpSettingName);
        description = CSTRING(wakeBackUpSettingDescription);
        values[] = {"Disabled", "Only player","Everyone"};
    };
    class GVAR(knockoutMultiplyer) {
        category = CSTRING(Category_Melee);
        value = 1;
        typeName = "SCALAR";
        displayName = CSTRING(knockOutMultiplyerSettingName);
        description = CSTRING(knockOutMultiplyerSettingDescription);
        sliderSettings[] = {0, 10, 1, 0.2};
    };
    class GVAR(weaponDropToggle) {
        category = CSTRING(Category_Melee);
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(weaponDropToggleSettingName);
        description = CSTRING(weaponDropToggleSettingDescription);
    };
};
