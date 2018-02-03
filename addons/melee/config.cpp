#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common","A3_Anims_F"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"0dr", "Crazy Brains Studio"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "ACE_Melee_Animations.hpp"
#include "CfgMoves.hpp"
#include "CfgGesturesMale.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
