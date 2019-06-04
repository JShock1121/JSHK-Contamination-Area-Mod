/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_condLoop.sqf
Parameters: unit
Return: none

*///////////////////////////////////////////////
params ["_unit"];

while {alive _unit} do
{
	private _inHot = false;
	private _inSafeArea = false;
	private _moppLevel = -1;
	private _timeDeath = -1;
	
	private _nearArea = [_unit] call JSHK_contam_fnc_nearestArea;
	if (_nearArea != "") then
	{
		_inHot = [_unit,_nearArea] call JSHK_contam_fnc_inHotZone;
		if (_inHot) then
		{
			//_moppLevel = [_nearArea,"mopp"] call JSHK_contam_fnc_getAreaInfo;
			//_timeDeath = [_nearArea,"timetodeath"] call JSHK_contam_fnc_getAreaInfo;
			private _info = [_nearArea,["mopp","timetodeath"]] call JSHK_contam_fnc_getAreaInfo;
			if (count _info > 0) then
			{
				_info params ["_lvl","_secs"];
				_mopplevel = _lvl;
				_timeDeath = _secs;
			};
		};
	};
	
	private _nearSafeArea = [_unit] call JSHK_contam_fnc_nearestSafeArea;
	if (_nearSafeArea != "") then
	{
		_inSafeArea = [_unit,_nearSafeArea] call JSHK_contam_fnc_inSafeArea;
	};
	private _inSafeVeh = [_unit] call JSHK_contam_fnc_inSafeVeh;
	private _handle = _unit getVariable ["JSHK_contam_damageHandle",false];
	
	if (_inHot && !_inSafeArea && !_inSafeVeh && !([_unit] call JSHK_contam_fnc_godModeEnabled)) then
	{
		if !([_unit,_moppLevel] call JSHK_contam_fnc_hasAllGear) then
		{
			if (!_handle) then
			{
				_unit setVariable ["JSHK_contam_damageHandle",true];
				[_unit,_timeDeath] call JSHK_contam_fnc_damage;
			};
		} else
		{
			if (_handle) then
			{
				_unit setVariable ["JSHK_contam_damageHandle",false];
			};
		};
	}
	else
	{
		if (_handle) then
		{
			_unit setVariable ["JSHK_contam_damageHandle",false];
		};
	};
	sleep 1;
};