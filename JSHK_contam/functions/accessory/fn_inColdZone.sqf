/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_inColdZone.sqf
Parameters: unit, string
Return: bool

*///////////////////////////////////////////////
params ["_unit",["_area","",[""]]];
private _inArea = false;
if (!([_area] call JSHK_contam_fnc_areaExists) || _area == "") exitWith { false; };
//private _radius = [_area,"coldrad"] call JSHK_contam_fnc_getAreaInfo;
//private _origin = [_area,"origin"] call JSHK_contam_fnc_getAreaInfo;

private _info = [_area,["origin","coldrad"]] call JSHK_contam_fnc_getAreaInfo;
if (count _info > 0) then
{
	_info params ["_origin","_radius"];
	if (_radius <= -1 || _origin isEqualTo [0,0,0]) exitWith 
	{
		if (isNil "JSHK_contam_inColdZoneError") then
		{
			["fn_inColdZone: radius or origin undefined.",true] call JSHK_contam_fnc_logMessage;
			JSHK_contam_inColdZoneError = true;
		};
	};

	_dis = _unit distance _origin;
	if (_dis <= _radius) then { _inArea = true; };
};
_inArea;