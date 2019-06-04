/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_checkCameraStatus.sqf
Parameters: unit
Return: bool

*///////////////////////////////////////////////
if !(hasInterface) exitWith {};
private _cam = cameraView;
private _bool = switch (JSHK_contam_whenOverlay) do
{
	case 0: {false;};
	case 1: {_cam in ["INTERNAL","GUNNER"];};
	case 2: {_cam in ["INTERNAL","EXTERNAL","GUNNER"];};
	default {_cam in ["INTERNAL","GUNNER"];};
};
_bool;