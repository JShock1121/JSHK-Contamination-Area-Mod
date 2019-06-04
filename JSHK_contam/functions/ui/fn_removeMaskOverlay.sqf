/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_removeMaskOverlay.sqf
Parameters: unit
Return: none

*///////////////////////////////////////////////
#include "\JSHK_contam\functions\ui\macros.hpp"
params ["_unit"];
if !(hasInterface) exitWith {};
if ([_unit] call JSHK_contam_fnc_hasMaskOverlay) then
{
	JSHK_CONTAM_MASK_DISPLAY closeDisplay 0;
	_unit setVariable ["JSHK_contam_hasOverlay",false];
};