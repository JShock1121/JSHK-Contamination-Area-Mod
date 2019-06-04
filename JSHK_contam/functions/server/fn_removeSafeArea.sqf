/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_removeSafeArea.sqf
Parameters: area (string or object)
Return: none

*///////////////////////////////////////////////
params [["_in",objNull,["",objNull]]];
if !(isServer) exitWith
{
	["JSHK_contam_fnc_removeSafeArea",_this] call JSHK_contam_fnc_requestExec;
};

if (count JSHK_contam_safeAreas < 1) exitWith {};
if !([_in] call JSHK_contam_fnc_safeAreaExists) exitWith { ["fn_removeSafeArea: Object or name provided does not exist.",true] call JSHK_contam_fnc_logMessage; };

private _areaInfo = [_in,["name","areamarker","warningmarker","object"]] call JSHK_contam_fnc_getSafeAreaInfo;
_areaInfo params ["_name","_areaMrk","_warnoMrk","_areaObj"];

[format ["fn_removeSafeArea - Contam area attempt remove: %1",_name]] call JSHK_contam_fnc_logMessage;

if (_areaMrk != "") then
{
	deleteMarker _areaMrk;
};
if (_warnoMrk != "") then
{
	deleteMarker _warnoMrk;
};
private _index = JSHK_contam_safeAreas find _areaObj;
if (_index != -1) then
{
	JSHK_contam_safeAreas deleteAt _index;
};
deleteVehicle _areaObj;

["JSHK_contam_safeAreas"] call JSHK_contam_fnc_updateAllClients;