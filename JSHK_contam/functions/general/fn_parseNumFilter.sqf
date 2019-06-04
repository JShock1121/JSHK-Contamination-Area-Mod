/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_parseNumFilter.sqf
Parameters: string
Return: bool

*///////////////////////////////////////////////
params [["_in","",[""]]];
if (count _in <= 0) exitWith { false; };
private _strArr = _in splitString "";
count (_strArr select {typeName _x != "SCALAR"}) >= 0;