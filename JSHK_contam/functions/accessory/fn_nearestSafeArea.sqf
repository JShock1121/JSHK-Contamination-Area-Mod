/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_nearestArea.sqf
Parameters: unit
Return: name of area

*///////////////////////////////////////////////
params [["_unit",objNull,[objNull]]];
private _name = "";
private _dis = -1;
if (isNull _unit) exitWith { _name; };
if (JSHK_contam_safeAreas isEqualTo []) exitWith { _name; };
{
	private _distanceFrom = [_unit,_x] call JSHK_contam_fnc_distanceFromSafeArea;
	if (_distanceFrom != -1) then
	{
		if (_dis == -1) then
		{
			_dis = _distanceFrom;
			_name = [_x,"name"] call JSHK_contam_fnc_getSafeAreaInfo;
		} else
		{
			if (_distanceFrom < _dis) then
			{
				_dis = _distanceFrom;
				_name = [_x,"name"] call JSHK_contam_fnc_getSafeAreaInfo;
			};
		};
	};
} forEach JSHK_contam_safeAreas;

_name;