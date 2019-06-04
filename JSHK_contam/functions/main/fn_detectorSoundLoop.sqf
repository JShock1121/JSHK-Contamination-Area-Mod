/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_inAreaLoop.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
params ["_unit"];
if (!hasInterface) exitWith {};

while {alive _unit} do
{
	private _inCold = false;
	private _inHot = false;
	private _inObjArea = false;
	
	private _nearArea = [_unit] call JSHK_contam_fnc_nearestArea;
	if (_nearArea != "") then
	{
		_inCold = [_unit,_nearArea] call JSHK_contam_fnc_inColdZone;
		_inHot = [_unit,_nearArea] call JSHK_contam_fnc_inHotZone;
		_inObjArea = [_unit,_nearArea] call JSHK_contam_fnc_inObjZone;
	};
	private _inSafeArea = [_unit,_nearArea] call JSHK_contam_fnc_inSafeArea;
	private _altSound = _inHot || _inObjArea;
	
	private _time = 1;
	if (_inCold && !_inSafeArea) then
	{
		if (JSHK_contam_requireDetector) then
		{
			[_unit,false,_altSound] spawn JSHK_contam_fnc_beep;
		}
		else
		{
			[_unit,true,_altSound] spawn JSHK_contam_fnc_beep;
		};
		if (JSHK_contam_enviroEffectsType != -1) then
		{
			//[JSHK_contam_enviroEffectsType,_perimeterLevel] spawn JSHK_contam_fnc_addEnviroEffect;
		};
	} else
	{
		//[_perimeterLevel] spawn JSHK_contam_fnc_removeEnviroEffect;
	};
	if (_inCold) then
	{
		_time = 2;
		if (_inHot) then
		{
			_time = 2;
			if (_inObjArea) then { _time = 0.75; };
		};
	} else { _time = 1; };
	
	sleep _time;
};