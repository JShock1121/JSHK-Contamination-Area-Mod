/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_soundDetector.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
#include "\JSHK_contam\functions\ui\macros.hpp"
disableSerialization;
if ([] call JSHK_contam_fnc_detectorPowerOn) then 
{
	if (JSHK_contam_detectorSoundEnabled) then
	{
		JSHK_CONTAM_DETECTOR_SOUNDICON ctrlShow true;
		JSHK_contam_detectorSoundEnabled = false;
	} else
	{
		JSHK_CONTAM_DETECTOR_SOUNDICON ctrlShow false;
		JSHK_contam_detectorSoundEnabled = true;
	};
};