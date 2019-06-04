/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_updateDetector.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
#include "\JSHK_contam\functions\ui\macros.hpp"

disableSerialization;

while {[] call JSHK_contam_fnc_detectorOn} do 
{
	private _dis = 0;
	private _pos = [0,0,0];
	private _radius = 1;
	private _nearArea = [player] call JSHK_contam_fnc_nearestArea;
	if (_nearArea != "") then
	{
		if ([player,_nearArea] call JSHK_contam_fnc_inArea) then
		{
			//_pos = [_nearArea,"origin"] call JSHK_contam_fnc_getAreaInfo;
			//_radius = [_nearArea,"coldrad"] call JSHK_contam_fnc_getAreaInfo;
			private _info = [_nearArea,["origin","coldrad"]] call JSHK_contam_fnc_getAreaInfo;
			if (count _info > 0) then
			{
				_info params ["_org","_rad"];
				_pos = _org;
				_radius = _rad;
			};
			_dis = [player,_nearArea] call JSHK_contam_fnc_distanceFromArea;
		};
	};
	
	private _contam = (1 -((_dis * 100 / _radius) * 0.01)) * JSHK_CONTAM_DETECTOR_MAX_CONTAM;
	if (_contam < 0 || _contam == JSHK_CONTAM_DETECTOR_MAX_CONTAM) then {_contam = 0.0;};
	if (_contam > JSHK_CONTAM_DETECTOR_MAX_CONTAM) then { _contam = JSHK_CONTAM_DETECTOR_MAX_CONTAM; };
	
	_text = parseText format ["%1", _contam];
	JSHK_CONTAM_DETECTOR_CONTAM_TEXT ctrlSetStructuredText _text;
	_daytime = [dayTime,"HH:MM"] call BIS_fnc_timeToString;
	_time = parseText format ["%1", _daytime];
	JSHK_CONTAM_DETECTOR_TIME_TEXT ctrlSetStructuredText _time;
	
	if (_pos isEqualTo [0,0,0] || _contam == 0) then
	{
		JSHK_CONTAM_DETECTOR_ARROW ctrlSetAngle [0, 0.5, 0.5];
	} else
	{
		_dir = [player,_pos] call BIS_fnc_relativeDirTo;
		JSHK_CONTAM_DETECTOR_ARROW ctrlSetAngle [_dir, 0.5, 0.5];
	};
	
	
	uiSleep 0.75;
};