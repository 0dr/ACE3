class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                #include "ACE_Camouflage_Actions.hpp"
            };
        };
        class ACE_Actions {
            class ACE_MainActions {
                #include "ACE_Camouflage_Actions.hpp"
            };

        };
    };
};
