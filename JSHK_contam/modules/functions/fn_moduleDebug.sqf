/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_moduleDebug.sqf
Parameters: logic
Return: none

*///////////////////////////////////////////////
params ["_logic"];

private _debug = (_logic getVariable ["JSHK_contamModuleVar_enableDebug",false]);
missionNamespace setVariable ["JSHK_contam_DEBUG",_debug];

private _net = (_logic getVariable ["JSHK_contamModuleVar_logNetwork",false]);
missionNamespace setVariable ["JSHK_contam_DEBUG_net",_net];

if (_debug) then
{
	["DEBUG enabled by module, expect reduced performance!!",true] call JSHK_contam_fnc_logMessage;
};
_logic setVariable ["JSHK_contamModule_initCompleted",true];