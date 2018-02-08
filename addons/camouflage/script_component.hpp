#define COMPONENT camouflage
#define COMPONENT_BEAUTIFIED Camouflage
#include "\z\ace\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
#define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_CAMOUFLAGE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_CHEMLIGHTS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_CAMOUFLAGE
#endif

#include "\z\ace\addons\main\script_macros.hpp"
