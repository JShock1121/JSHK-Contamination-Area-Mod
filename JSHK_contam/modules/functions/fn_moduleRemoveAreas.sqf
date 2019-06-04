/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_moduleRemoveAreas.sqf
Parameters: logic, list of units, boolean
Return: none

*///////////////////////////////////////////////
params ["_logic","_units","_activated"];
if (_activated) then
{
	private _names = _logic getVariable ["JSHK_contamModuleVar_areaNames",""];
	private _areas = [_names] call JSHK_contam_fnc_strToArray;
	[format ["fn_moduleRemoveAreas _areas array return: %1",_areas]] call JSHK_contam_fnc_logMessage;
	{
		[_x] call JSHK_contam_fnc_removeArea;
	} forEach _areas;
};

_logic setVariable ["JSHK_contamModule_initCompleted",true];