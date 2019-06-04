/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_getMaskOverlayType.sqf
Parameters: unit
Return: none

*///////////////////////////////////////////////
params ["_unit"];
if !(hasInterface) exitWith {};
private _return = -1;
private _item = objNull;

if (JSHK_contam_maskTypeOfGear == 1) then {_item = goggles _unit} else {_item = headgear _unit}; 

switch (true) do
{
	case (_item in JSHK_contam_gasMasksTwo): { _return = 0; };
	case (_item in JSHK_contam_gasMasks50): { _return = 1; };
	case (_item in JSHK_contam_gasMasksOpen): { _return = 2; };
	default {};
};
_return;