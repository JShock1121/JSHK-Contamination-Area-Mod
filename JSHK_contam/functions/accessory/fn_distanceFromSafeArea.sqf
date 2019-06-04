/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_distanceFromArea.sqf
Parameters: unit, string
Return: integer

*///////////////////////////////////////////////
params [["_unit",objNull,[objNull]],["_areaIn",objNull,[objNull,""]]];

if (typeName _areaIn == "STRING") then
{
	_areaIn = [_areaIn] call JSHK_contam_fnc_findSafeArea;
};
if (isNull _unit || isNull _areaIn) exitWith { -1; };

_unit distance _areaIn;