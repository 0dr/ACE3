class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(updateCamo) {
                    displayName = "UPDATE"; //CSTRING(UpdateCamo);
                    condition = QUOTE(call FUNC(canUpdate));
                    statement = ""; //QUOTE(call FUNC(create_dialog));
                    showDisabled = 0;
                    priority = 2;
                    icon = QPATHTOF(UI\updateCamo_Icon.paa);
                    exceptions[] = {"notOnMap", "isNotInside"};

                    class Arid {
                        displayName = "arid"; //CSTRING(Arid);
                        condition = QUOTE([ARR_2(_player, 'ARID')] call DFUNC(canUpdateCamo));
                        exceptions[] = {"isNotInside", "isNotSwimming"};
                        statement = QUOTE([ARR_2(_player, 'ARID')] call DFUNC(updateCamo));
                        showDisabled = 0;
                        priority = 2;
                    };
                    class SemiArid:Arid {
                        displayName = "SemiArid"; //CSTRING(Arid);
                        condition = QUOTE([ARR_2(_player, 'SEMIARID')] call DFUNC(canUpdateCamo));
                        statement = QUOTE([ARR_2(_player, 'SEMIARID')] call DFUNC(updateCamo));
                    };
                    class Lush:Arid {
                        displayName = "Lush"; //CSTRING(Arid);
                        condition = QUOTE([ARR_2(_player, 'LUSH')] call DFUNC(canUpdateCamo));
                        statement = QUOTE([ARR_2(_player, 'LUSH')] call DFUNC(updateCamo));
                    };
                    class Jungle:Arid {
                        displayName = "Jungle"; //CSTRING(Arid);
                        condition = QUOTE([ARR_2(_player, 'JUNGLE')] call DFUNC(canUpdateCamo));
                        statement = QUOTE([ARR_2(_player, 'JUNGLE')] call DFUNC(updateCamo));
                    };
                    class Strip:Arid {
                        displayName = "Strip"; //CSTRING(Arid);
                        condition = QUOTE([ARR_2(_player, 'ARID')] call DFUNC(canUpdateCamo));
                        statement = QUOTE([ARR_2(_player, 'STRIPARID')] call DFUNC(updateCamo));
                    };
                    class StripJungle:Arid {
                        displayName = "StripJungle"; //CSTRING(Arid);
                        condition = QUOTE([ARR_2(_player, 'JUNGLE')] call DFUNC(canUpdateCamo));
                        statement = QUOTE([ARR_2(_player, 'STRIPJUNGLE')] call DFUNC(updateCamo));
                    };
                };
            };
        };
    };
};
