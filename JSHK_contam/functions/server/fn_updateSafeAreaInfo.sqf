/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_updateSafeAreaInfo.sqf
Parameters: array of arrays
Return: area obj

*///////////////////////////////////////////////
params [["_areaIn","",["",objNull]],["_requestedInfo",[],[[]]]];

private _areaObj = objNull;
if (!isServer) exitWith 
{ 
	["JSHK_contam_fnc_updateSafeAreaInfo",_this] call JSHK_contam_fnc_requestExec;
	_areaObj; 
};
if (count _requestedInfo < 1) exitWith { _areaObj; };

private _typeInput = typeName _areaIn;
if (_typeInput == "OBJECT") then
{
	_areaObj = _areaIn;
} else
{
	_areaObj = [_areaIn] call JSHK_contam_fnc_findSafeArea;
};
if (isNull _areaObj) exitWith { _areaObj; };

private _areaMrks = [_areaObj,["areamarker","warningmarker"]] call JSHK_contam_fnc_getSafeAreaInfo;
_areaMrks params ["_mrk","_warnMrk"];

{
	_x params ["_info","_val"];
	switch (toLower _info) do
	{
		case "origin": 
		{
			_areaObj setVariable ["JSHK_contam_safeOrigin",_val,true];
			
			_mrk setMarkerPos getPosWorld _areaObj;
			_warnMrk setMarkerPos getPosWorld _areaObj;
		};
		case "name":
		{
			_areaObj setVariable ["JSHK_contam_areaName",_val,true];
		};
		case "radius":
		{
			_areaObj setVariable ["JSHK_contam_coldZoneRadius",_val,true];
			_mrk setMarkerSize [_val,_val];
		};
		/*case "areamarker":
		{
			_areaObj setVariable ["JSHK_contam_areaMrk",_val,true];
		};
		case "warningmarker":
		{
			_areaObj setVariable ["JSHK_contam_warnMrk",_val,true];
		};*/
		default 
		{ 
			[format ["fn_updateSafeAreaInfo: Requested information does not exist - %1",_x],true] call JSHK_contam_fnc_logMessage;
		};
	};
} forEach _requestedInfo;

_areaObj;