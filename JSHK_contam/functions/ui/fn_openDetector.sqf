/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_openDetector.sqf
Parameters: unit
Return: none

*///////////////////////////////////////////////
#include "\JSHK_contam\functions\ui\macros.hpp"
params ["_unit"];
disableSerialization;
if (!([] call JSHK_contam_fnc_detectorOn)) then 
{
	(findDisplay 46) createDisplay "rscContaminationDialog";
	
	JSHK_CONTAM_DETECTOR_ARROW ctrlShow false;
	
	if ([] call JSHK_contam_fnc_detectorPowerOn) then 
	{
		[] spawn JSHK_contam_fnc_updateDetector;
	} else 
	{
		JSHK_CONTAM_DETECTOR_SCREEN ctrlSetTextColor [1,1,1,1];
	};
	////////////////////////
		JSHK_CONTAM_DETECTOR_SOUNDICON ctrlShow false;
	///////////////////////
	//[] spawn JSHK_contam_fnc_soundDetector;
	_kD = (findDisplay 54701) displayAddEventHandler 
	[
		"KeyDown",
		{
			params ["_ctrl", "_dik"];
			private _handled = false;
			if (_dik in (actionKeys "Watch") && [player] call JSHK_contam_fnc_hasDetector) then
			{
				[] call JSHK_contam_fnc_closeDetector;
				_handled = true;
			};
			_handled;
		}
	];
	player setVariable ["JSHK_contam_detectDisplay_kDEH",_kD];
};