/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_inSafeArea.sqf
Parameters: unit
Return: bool

*///////////////////////////////////////////////
params ["_unit",["_area","",[""]]];
private _inArea = false;
if (_area == "") exitWith
{
	private _near = [_unit] call JSHK_contam_fnc_nearestSafeArea;
	if !(_near == "") then
	{
		_inArea = [_unit,_near] call JSHK_contam_fnc_inSafeArea;
	};
	_inArea;
};
private _info = [_area,["radius","origin"]] call JSHK_contam_fnc_getSafeAreaInfo;
if (count _info > 0) then
{
	_info params ["_radius","_origin"];
	if (_radius == -1 || _origin isEqualTo [0,0,0]) exitWith {};

	_dis = _unit distance _origin;
	if (_dis <= _radius) exitWith { _inArea = true; };
};
	
_inArea;