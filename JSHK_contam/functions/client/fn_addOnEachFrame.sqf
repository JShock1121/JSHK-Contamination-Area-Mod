/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_addOnEachFrame.sqf
Parameters: unit
Return: none

*///////////////////////////////////////////////
params ["_unit"];
if !(hasInterface) exitWith {};

private _active =  missionNamespace getVariable ["BIS_stackedEventHandlers_onEachFrame",[]];
if ("JSHK_contam_OEF_StackedID" in _active) exitWith {};

[
	"JSHK_contam_OEF_StackedID",
	"onEachFrame",
	{
		params ["_unit"];
		if ([_unit] call JSHK_contam_fnc_isWearingMask && [] call JSHK_contam_fnc_checkCameraStatus) then
		{
			[_unit] call JSHK_contam_fnc_addMaskOverlay;
		} else
		{
			[_unit] call JSHK_contam_fnc_removeMaskOverlay;
		};
	},
	[_unit]
] call BIS_fnc_addStackedEventHandler;