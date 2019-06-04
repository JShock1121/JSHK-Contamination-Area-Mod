/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_addSafeArea.sqf
Parameters: position, radius, number/decimal
Return: none

*///////////////////////////////////////////////
params 
[
	"_pos",
	["_radius",100,[1]],
	["_alphaMarker",1,[1]],
	["_name","",[""]],
	["_execAll",false,[false]],
	["_zeused",false,[false]]
];
if (isServer && _name == "") then
{
	_name = format ["ContaminationSafeArea_%1",JSHK_contam_safeIterator];
};
if !(isServer) exitWith 
{
	private _sendParams = [_pos,_radius,_alphaMarker,_name,true,_zeused];
	["JSHK_contam_fnc_addSafeArea",_sendParams] call JSHK_contam_fnc_requestExec;
	_name;
};

private _dummy = "JSHK_contam_dummyObject" createVehicle _pos;
_dummy enableSimulation false; 
hideObjectGlobal _dummy; 
_dummy allowDamage false;

private _newMrk = createMarker [format["JSHK_contamSafeZoneMarker_%1",JSHK_contam_safeIterator],_pos];
private _safe = createMarker [format["JSHK_contamClearMarker_%1",JSHK_contam_safeIterator],_pos];
_newMrk setMarkerShape "ELLIPSE";
_newMrk setMarkerSize [_radius,_radius];
if (_alphaMarker == -1) then
{
	_safe setMarkerShape "ICON";
	_safe setMarkerType "mil_warning";
	_safe setMarkerColor "ColorBlue";
	_safe setMarkerText "Safe Zone";
	
	_newMrk setMarkerBrush "DIAGGRID";
	_newMrk setMarkerColor "ColorBlue";
}
else
{
	if (_alphaMarker == -2) then {_alphaMarker = 0.5;};
	_newMrk setMarkerAlpha _alphaMarker;
	_newMrk setMarkerColor "ColorBlue";
};

_dummy setVariable ["JSHK_contam_safeOrigin",_pos,true];
_dummy setVariable ["JSHK_contam_safeMrk",_safe,true];
_dummy setVariable ["JSHK_contam_safeAreaMrk",_newMrk,true];
_dummy setVariable ["JSHK_contam_coldZoneRadius",_radius,true];
//vertical extent of zone
_dummy setVariable ["JSHK_contam_areaName",_name,true];

JSHK_contam_safeAreas pushBack _dummy;

JSHK_contam_safeIterator = JSHK_contam_safeIterator + 1;

_dummy addEventHandler
[
	"Deleted",
	{
		params ["_obj"];

		[_obj] call JSHK_contam_fnc_removeSafeArea;
	}
];

if (_zeused) then
{
	{ _x addCuratorEditableObjects [[_dummy],false] } forEach allCurators;
};

if (_execAll || JSHK_contam_serverInitComplete) then
{
	["JSHK_contam_safeAreas"] call JSHK_contam_fnc_updateAllClients;
	[format ["fn_addSafeArea: Attempt to exectute safe zone creation outside module init on all clients- Safe Area Name: %1",_name],JSHK_contam_DEBUG_net] call JSHK_contam_fnc_logMessage;
};
[format ["fn_addSafeArea - Attempt to add safe area to pool: %1",_name],false] call JSHK_contam_fnc_logMessage;
_name;