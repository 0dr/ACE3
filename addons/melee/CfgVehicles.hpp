class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(takedown) {
                    displayName = CSTRING(takdown);
                    condition = QUOTE(true);
                    statement = QUOTE([_player, _target] call FUNC(takedown));
                    distance = 2;
                    showDisabled = 0;
                    priority = 2;
                    icon = ""; //QPATHTOF(UI\ATRAG_Icon.paa);
                    exceptions[] = {};
                };
            };
        };
    };
};
