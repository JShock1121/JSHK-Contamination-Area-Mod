/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_beep.sqf
Parameters: unit,  override : boolean (play sound without gear check)
				alt : boolean (play alternate sound)
Return: none

*///////////////////////////////////////////////
params ["_unit","_override",["_alt",false]];
if !(JSHK_contam_detectorEnabled || JSHK_contam_detectorSoundEnabled) exitWith {};

private _sound = "beep_target";
if (_alt) then {_sound = "FD_Finish_F";};
if(_override) exitWith {playSound _sound;};

if ([_unit] call JSHK_contam_fnc_hasDetector && 
	[] call JSHK_contam_fnc_detectorPowerOn && 
	JSHK_contam_detectorSoundEnabled) then
{
	playSound _sound;
};