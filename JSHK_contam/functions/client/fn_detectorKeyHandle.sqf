/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_addOnEachFrame.sqf
Parameters: unit
Return: none

*///////////////////////////////////////////////
#include "\JSHK_contam\functions\ui\macros.hpp"
params ["_unit"];
_kD = (findDisplay 46) displayAddEventHandler 
[
	"KeyDown",
	{
		params ["_ctrl", "_dik"];
		private _handled = false;
		if (_dik in (actionKeys "Watch") && [player] call JSHK_contam_fnc_hasDetector) then
		{
			if !([] call JSHK_contam_fnc_detectorOn) then
			{
				[] call JSHK_contam_fnc_openDetector;
			} else
			{
				[] call JSHK_contam_fnc_closeDetector;
			};
			_handled = true;
		};
		_handled;
	}
];