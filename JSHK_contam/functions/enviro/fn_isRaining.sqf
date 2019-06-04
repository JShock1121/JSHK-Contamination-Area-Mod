/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_isRaining.sqf
Parameters: none
Return: bool if raining

*///////////////////////////////////////////////
params [["_threshold",-1,[0]]];
if (_threshold isEqualTo -1) exitWith {false;};
rain > _threshold;