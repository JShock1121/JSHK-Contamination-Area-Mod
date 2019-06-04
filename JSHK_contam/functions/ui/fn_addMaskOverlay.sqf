/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_addMaskOverlay.sqf
Parameters: unit
Return: none

*///////////////////////////////////////////////
#include "\JSHK_contam\functions\ui\macros.hpp"
params ["_unit"];
if !(hasInterface) exitWith {};
if !([_unit] call JSHK_contam_fnc_hasMaskOverlay) then
{
	private _maskType = [_unit] call JSHK_contam_fnc_getMaskOverlayType;
	if (_maskType == -1) exitWith {};
	150 cutRsc ["Rsc_JSHK_contam_overlay","PLAIN",1,false];
	(JSHK_CONTAM_MASK_DISPLAY displayCtrl JSHK_CONTAM_MASK_OVERLAY) ctrlSetText JSHK_CONTAM_MASK_OVERLAY_PATH(_maskType);
	_unit setVariable ["JSHK_contam_hasOverlay",true];
};