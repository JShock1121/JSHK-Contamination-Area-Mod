/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_inArea.sqf
Parameters: unit, string
Return: bool

*///////////////////////////////////////////////
params ["_unit",["_area","",[""]]];
private _inArea = false;
if (_area == "") exitWith
{
	private _near = [_unit] call JSHK_contam_fnc_nearestArea;
	if !(_near == "") then
	{
		_inArea = [_unit,_near] call JSHK_contam_fnc_inArea;
	};
	_inArea;
};


private _info = [_area,["origin","coldrad","hotrad","objrad"]] call JSHK_contam_fnc_getAreaInfo;
if (count _info > 0) then
{
	_info params ["_origin","_coldRad","_hotRad","_objRad"];
	private _radi = [_coldRad,_hotRad,_objRad];

	if (_origin isEqualTo [0,0,0]) exitWith {};

	private _dis = _unit distance2D _origin;
	_inArea = count (_radi select {_dis <= _x && _x != -1}) > 0;
};
	
_inArea;