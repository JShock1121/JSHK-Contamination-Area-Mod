/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_inObjZone.sqf
Parameters: unit, string
Return: bool

*///////////////////////////////////////////////
params ["_unit",["_area","",[""]]];
private _inArea = false;
if (!([_area] call JSHK_contam_fnc_areaExists) || _area == "") exitWith { false; };
//private _radius = [_area,"objrad"] call JSHK_contam_fnc_getAreaInfo;
//private _origin = [_area,"origin"] call JSHK_contam_fnc_getAreaInfo;

private _info = [_area,["origin","objrad"]] call JSHK_contam_fnc_getAreaInfo;
if (count _info > 0) then
{
	_info params ["_origin","_radius"];
	if (_radius <= -1 || _origin isEqualTo [0,0,0]) exitWith 
	{
		if (isNil "JSHK_contam_inObjZoneError") then
		{
			["fn_inObjZone: radius or origin undefined.",true] call JSHK_contam_fnc_logMessage;
			JSHK_contam_inObjZoneError = true;
		};
	};

	_dis = _unit distance _origin;
	if (_dis <= _radius) then { _inArea = true; };
};
_inArea;