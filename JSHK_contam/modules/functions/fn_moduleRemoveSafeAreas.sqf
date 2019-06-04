/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_moduleRemoveSafeAreas.sqf
Parameters: logic, list of units, boolean
Return: none

*///////////////////////////////////////////////
params ["_logic","_units","_activated"];
if (_activated) then
{
	private _names = _logic getVariable ["JSHK_contamModuleVar_safeAreaNames",""];
	private _areas = [_names] call JSHK_contam_fnc_strToArray;
	{
		[_x] call JSHK_contam_fnc_removeSafeArea;
	} forEach _areas;
};

_logic setVariable ["JSHK_contamModule_initCompleted",true];