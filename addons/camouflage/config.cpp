
#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common","A3_Map_Data","A3_Map_Data_Exp","A3_Map_Malden"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"0dr"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgSurfaces.hpp"
