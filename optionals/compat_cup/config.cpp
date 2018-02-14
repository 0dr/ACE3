#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"CUP_Worlds_Surfaces","ace_camouflage"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"0dr"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgSurfaces.hpp"
