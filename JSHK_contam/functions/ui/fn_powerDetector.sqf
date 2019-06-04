/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_powerDetector.sqf
Parameters: none
Return: bool

*///////////////////////////////////////////////
#include "\JSHK_contam\functions\ui\macros.hpp"
disableSerialization;
if ([] call JSHK_contam_fnc_detectorPowerOn) then
{
	JSHK_CONTAM_DETECTOR_ARROW ctrlShow false;
	JSHK_CONTAM_DETECTOR_TIME_TEXT ctrlShow false;
	//JSHK_CONTAM_DETECTOR_SOUNDICON ctrlShow false;
	JSHK_CONTAM_DETECTOR_SCREEN ctrlSetTextColor [1,1,1,1];
	profileNamespace setVariable ["JSHK_contam_detectorPower",false];
} else
{
	if (JSHK_contam_detectorArrowEnabled) then
	{
		JSHK_CONTAM_DETECTOR_ARROW ctrlShow true;
	};
	JSHK_CONTAM_DETECTOR_TIME_TEXT ctrlShow true;
	profileNamespace setVariable ["JSHK_contam_detectorPower",true];
	//[] spawn JSHK_contam_fnc_soundDetector;
	[] spawn JSHK_contam_fnc_updateDetector;		
	private _transparency = 0.95;
	 while {_transparency > 0} do
	{
		JSHK_CONTAM_DETECTOR_SCREEN ctrlSetTextColor [1, 1, 1, _transparency];
		_transparency = _transparency - 0.1;
		sleep 0.005;
	};	
};
////////////////////////////////
JSHK_CONTAM_DETECTOR_SOUNDICON ctrlShow false;
///////////////////////////////