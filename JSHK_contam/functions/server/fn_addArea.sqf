/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_addArea.sqf
Parameters: position, radius, number/decimal
Return: none

*///////////////////////////////////////////////
params 
[
	"_pos",
	["_radiusArr",[100,50,5],[[]]],
	["_timeToDeath",100,[0]],
	["_alphaMarker",1,[1]],
	["_originState",[false,nil,true],[[]]],
	["_mopp",-1,[0]],
	["_name","",[""]],
	["_execAll",false,[false]],
	["_zeused",false,[false]]
];

if (isServer && _name == "") then
{
	_name = format ["ContaminationArea_%1",JSHK_contam_contamIterator];
};
if !(isServer) exitWith 
{
	private _sendParams = [_pos,_radiusArr,_timeToDeath,_alphaMarker,_originState,_mopp,_name,true,_zeused];
	["JSHK_contam_fnc_addArea",_sendParams] call JSHK_contam_fnc_requestExec;
	_name;
};

_radiusArr params ["_radius","_hotRadius","_objRadius"];

{ if (_x < 0) then { _x = 0; }; } forEach [_radius,_hotRadius,_objRadius,_timeToDeath];

_dummy = "JSHK_contam_dummyObject" createVehicle _pos;
_dummy enableSimulation false; 
hideObjectGlobal _dummy; 
_dummy allowDamage false;

_originState params ["_isOrigin","_obj","_delOnDestroy"];
if (_isOrigin) then
{
	if (_delOnDestroy) then
	{
		_obj setVariable ["JSHK_contam_savedArea",_dummy];
		_obj addEventHandler
		[
			"Killed",
			{
				private _obj = (_this select 0) getVariable ["JSHK_contam_savedArea",objNull];
				[_obj] call JSHK_contam_fnc_removeArea;
			}
		];
		_obj addEventHandler
		[
			"Deleted",
			{
				params ["_in"];
				private _obj = (_this select 0) getVariable ["JSHK_contam_savedArea",objNull];
				[_obj] call JSHK_contam_fnc_removeArea;
			}
		];
		if (owner _obj != 2) then { _obj setOwner 2; };
	};
	_dummy setPos getPosWorld _obj;
};

private _areaMrk = createMarker [format["JSHK_contamAreaMarker_%1",JSHK_contam_contamIterator],_pos];
private _warn = createMarker [format["JSHK_contamWarningMarker_%1",JSHK_contam_contamIterator],_pos];
_areaMrk setMarkerShape "ELLIPSE";
_areaMrk setMarkerSize [_radius,_radius];
if (_alphaMarker == -1) then
{
	_warn setMarkerShape "ICON";
	_warn setMarkerType "mil_warning";
	_warn setMarkerColor "ColorRed";
	_warn setMarkerText "Hazardous Area";
	
	_areaMrk setMarkerBrush "DIAGGRID";
	_areaMrk setMarkerColor "ColorRed";
}
else
{
	if (_alphaMarker == -2) then {_alphaMarker = 0.5;};
	_areaMrk setMarkerAlpha _alphaMarker;
	_areaMrk setMarkerColor "ColorBlack";
};

//if (_hotRadius > _radius) then { _hotRadius = _radius; };
//if (_objRadius > _hotRadius) then { _objRadius = _hotRadius; };
_dummy setVariable ["JSHK_contam_origin",_pos,true];
_dummy setVariable ["JSHK_contam_warnMrk",_warn,true];
_dummy setVariable ["JSHK_contam_areaMrk",_areaMrk,true];
_dummy setVariable ["JSHK_contam_coldZoneRadius",_radius,true];
_dummy setVariable ["JSHK_contam_hotZoneRadius",_hotRadius,true];
_dummy setVariable ["JSHK_contam_objectZoneRadius",_objRadius,true];
//_dummy setVariable ["JSHK_contam_allAreaRadi",[_radius,_hotRadius,_objRadius],true];
//vertical extent of zone
_dummy setVariable ["JSHK_contam_areaMoppLevel",_mopp,true];
_dummy setVariable ["JSHK_contam_areaTimeToDeath",_timeToDeath,true];
_dummy setVariable ["JSHK_contam_areaName",_name,true];

JSHK_contam_areas pushBack _dummy;

JSHK_contam_contamIterator = JSHK_contam_contamIterator + 1;

_dummy addEventHandler
[
	"Deleted",
	{
		params ["_obj"];

		[_obj] call JSHK_contam_fnc_removeArea;
	}
];

if (_zeused) then
{
	{ _x addCuratorEditableObjects [[_dummy],false] } forEach allCurators;
};

if (_execAll || JSHK_contam_serverInitComplete) then
{
	["JSHK_contam_areas"] call JSHK_contam_fnc_updateAllClients;
	[format ["fn_addArea: Attempt to exectute contamination zone creation outside module init on all clients- Area Name: %1",_name],JSHK_contam_DEBUG_net] call JSHK_contam_fnc_logMessage;
};
[format ["fn_addArea - Attempt to add contamination area to pool: %1",_name],false] call JSHK_contam_fnc_logMessage;
_name;