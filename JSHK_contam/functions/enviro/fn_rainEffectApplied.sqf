/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_rainEffectApplied.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
params [["_unit",objNull,[objNull]]];
if (isNull _unit) exitWith {};
!((_unit getVariable ["JSHK_contam_rainPP",[]]) isEqualTo [])
