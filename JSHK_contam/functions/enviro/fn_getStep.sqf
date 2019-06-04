/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_getStep.sqf
Parameters: number
Return: number

*///////////////////////////////////////////////
params [["_in",1,[0]]];
if (_in < 0) exitWith {0};
if (_in == 0) then {_in = 0.5;};

(1/_in);