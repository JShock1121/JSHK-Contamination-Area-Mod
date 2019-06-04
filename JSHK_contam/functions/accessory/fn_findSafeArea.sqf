/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_findSafeArea.sqf
Parameters: string
Return: object

*///////////////////////////////////////////////
params [["_areaName",nil,[""]]];
private _return = objNull;

if (isNil "_areaName") exitWith 
{
	["fn_findSafeArea: Area name provided was nil.",true] call JSHK_contam_fnc_logMessage;
	_return;
};
if (isNil "JSHK_contam_safeAreas") exitWith 
{
	["fn_findSafeArea: JSHK_contam_safeAreas undefined!"] call JSHK_contam_fnc_logMessage;
	_return;
};
{
	private _objName = _x getVariable ["JSHK_contam_areaName",""];
	if (_objName == _areaName) exitWith { _return = _x; };
} forEach JSHK_contam_safeAreas;
_return;