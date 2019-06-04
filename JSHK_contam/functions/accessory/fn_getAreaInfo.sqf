/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_getAreaInfo.sqf
Parameters: string or object, string
Return: Array or single return depending

*///////////////////////////////////////////////
params [["_areaIn","",["",objNull]],["_requestedInfo","",["",[]]]];

private _areaObj = objNull;
private _typeInput = typeName _areaIn;
if (_typeInput == "OBJECT") then
{
	_areaObj = _areaIn;
} else
{
	_areaObj = [_areaIn] call JSHK_contam_fnc_findArea;
};

private _return = [];
if !([_areaObj] call JSHK_contam_fnc_areaExists) exitWith { _return; };

private _typeInfoArr = [];

if (typeName _requestedInfo == "STRING") then
{
	_typeInfoArr pushBack _requestedInfo;
} else
{
	if (typeName _requestedInfo == "ARRAY") then
	{
		_typeInfoArr = _requestedInfo select {typeName _x == "STRING"};
	};
};
{
	private _ele = 
	switch (toLower _x) do
	{
		case "origin": 
		{
			private _a = _areaObj getVariable ["JSHK_contam_origin",[0,0,0]];
			_a;
		};
		case "name":
		{
			private _a = _areaObj getVariable ["JSHK_contam_areaName",""];
			_a;
		};
		case "coldrad":
		{
			private _a = _areaObj getVariable ["JSHK_contam_coldZoneRadius",-1];
			_a;
		};
		case "hotrad":
		{
			private _a = _areaObj getVariable ["JSHK_contam_hotZoneRadius",-1];
			_a;
		};
		case "objrad":
		{
			private _a = _areaObj getVariable ["JSHK_contam_objectZoneRadius",-1];
			_a;
		};
		/*case "allradius":
		{
			private _a = _areaObj getVariable ["JSHK_contam_allAreaRadi",[-1,-1,-1]];
			_a;
		};*/
		case "mopp":
		{
			private _a = _areaObj getVariable ["JSHK_contam_areaMoppLevel",-1];
			_a;
		};
		case "timetodeath":
		{
			private _a = _areaObj getVariable ["JSHK_contam_areaTimeToDeath",-1];
			_a;
		};
		case "areamarker":
		{
			private _a = _areaObj getVariable ["JSHK_contam_areaMrk",""];
			_a;
		};
		case "warningmarker":
		{
			private _a = _areaObj getVariable ["JSHK_contam_warnMrk",""];
			_a;
		};
		case "object":
		{
			private _a = _areaObj;
			_a;
		};
		default 
		{ 
			[format ["fn_getAreaInfo: Requested information does not exist - %1",_x],true] call JSHK_contam_fnc_logMessage;
			private _a = nil; _a;
		};
	};
	_return set [_forEachIndex,_ele];
} forEach _typeInfoArr;

private _returnCnt = count _return;
private _returnAllNil = count (_return select {isNil {_x}}) == _returnCnt;
if (_returnAllNil) exitWith { []; };
if (_returnCnt == 1) exitWith { _return select 0; };

_return;