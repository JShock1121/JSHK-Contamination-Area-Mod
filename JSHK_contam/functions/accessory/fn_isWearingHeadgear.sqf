/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_isWearingHeadgear.sqf
Parameters: unit
Return: Boolean

*///////////////////////////////////////////////
params ["_unit"];
if ((headgear _unit) in JSHK_contam_headgear) then { true; } else {	false; };