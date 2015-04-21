/*
 * Author: commy2
 * Module for adjusting the repair damage settings
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * Return Value:
 * None <NIL>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_logic", "_units", "_activated"];

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {};

[_logic, QGVAR(engineerSetting_Repair), "engineerSetting_Repair"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(engineerSetting_Wheel), "engineerSetting_Wheel"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(consumeItem_ToolKit), "consumeItem_ToolKit"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(repairDamageThreshold), "repairDamageThreshold"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(repairDamageThreshold_Engineer), "repairDamageThreshold_Engineer"] call EFUNC(common,readSettingFromModule);
