/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_moduleEnviro.sqf
Parameters: logic, list of units, boolean
Return: none

*///////////////////////////////////////////////
params ["_logic","_units","_activated"];
if (_activated) then
{
	JSHK_contam_requireDetector = _logic getVariable ["JSHK_contamModuleVar_requireDetector",true];
	JSHK_contam_detectorArrowEnabled = _logic getVariable ["JSHK_contamModuleVar_detectorArrowEnabled",true];
};
_logic setVariable ["JSHK_contamModule_initCompleted",true];