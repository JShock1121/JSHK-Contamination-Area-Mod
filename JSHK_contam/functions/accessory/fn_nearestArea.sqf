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
if (JSHK_contam_areas isEqualTo []) exitWith { _name; };
{
	private _distanceFrom = [_unit,_x] call JSHK_contam_fnc_distanceFromArea;
	if (_distanceFrom != -1) then
	{
		if (_dis == -1) then
		{
			_dis = _distanceFrom;
			_name = [_x,"name"] call JSHK_contam_fnc_getAreaInfo;
		} else
		{
			if (_distanceFrom < _dis) then
			{
				_dis = _distanceFrom;
				_name = [_x,"name"] call JSHK_contam_fnc_getAreaInfo;
			};
		};
	};
} forEach JSHK_contam_areas;

_name;