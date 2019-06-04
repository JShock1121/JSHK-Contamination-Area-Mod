/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_findArea.sqf
Parameters: string
Return: object

*///////////////////////////////////////////////
params [["_areaName",nil,[""]]];
private _return = objNull;

if (isNil "_areaName") exitWith 
{
	["fn_findArea: Area name provided was nil.",true] call JSHK_contam_fnc_logMessage;
	_return;
};
if (isNil "JSHK_contam_areas") exitWith 
{
	["fn_findArea: JSHK_contam_areas undefined!"] call JSHK_contam_fnc_logMessage;
	_return;
};
{
	private _objName = _x getVariable ["JSHK_contam_areaName",""];
	if (_objName == _areaName) exitWith { _return = _x; };
	false;
} count JSHK_contam_areas;
_return;