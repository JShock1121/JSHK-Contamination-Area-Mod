/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_godModeEnabled.sqf
Parameters: unit
Return: bool

*///////////////////////////////////////////////
params [["_unit",objNull,[objNull]]];
private _return = false;
if (isNull _unit) exitWith { _return; };

if !(isNil "JSHK_contam_godModeUnits") then
{
	_return = _unit in JSHK_contam_godModeUnits;
} else {["fn_godModeEnabled: Variable returning nil"] call JSHK_contam_fnc_logMessage;};
_return;
