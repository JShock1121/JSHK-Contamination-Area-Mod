/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_isZeus.sqf
Parameters: unit
Return: bool

*///////////////////////////////////////////////
params [["_unit",objNull,[objNull]]];
if (isNull _unit) exitWith {false;};
(_unit in (allCurators apply {getAssignedCuratorUnit _x}));
