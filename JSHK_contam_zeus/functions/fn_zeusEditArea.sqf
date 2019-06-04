/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_zeusEditArea.sqf
Parameters: pos and cursorObj under module
Return: none

*///////////////////////////////////////////////
params [["_obj",objNull,[objNull]]];

if (!hasInterface || !([player] call JSHK_contam_fnc_isZeus)) exitWith {};

private _info = [];
if (!isNull _obj) then
{
	_info = [_obj,["name","coldrad","hotrad","objrad","mopp","timetodeath"]] call JSHK_contam_fnc_getAreaInfo;
};
if (_info isEqualTo []) exitWith {};
_info params 
[
	"_orgName",
	"_orgRad",
	"_orgHRad",
	"_orgORad",
	"_orgMopp",
	"_orgTime"
];

private _dialogResult =
[
	"Edit Contaminated Area",
	[
		["Area Name", "", _orgName,true],
		["Cold Zone Radius", "", str(_orgRad),true],
		["Hot Zone Radius", "", str(_orgHRad),true],
		["Object Zone Radius", "", str(_orgORad),true],
		["Time to Death (in secs)", "", str(_orgTime),true],
		["MOPP Level", ["No MOPP","MOPP 1 (mask only)","MOPP 2 (mask and uniform)","MOPP 3 (mask/uniform/vest)"],_orgMopp,true]
	]
] call Ares_fnc_showChooseDialog;

if (_dialogResult isEqualTo []) exitWith{};

_dialogResult params 
[
	"_name",
	"_cold","_hot","_objRad",
	"_timeDead",
	"_mopplevel"
];

if ([_name] call JSHK_contam_fnc_areaExists) exitWith
{
	["Area name already exists!"] call Achilles_fnc_showZeusErrorMessage;
};

private _radiusArray = [_cold,_hot,_objRad];

if ((count (_radiusArray select {!([_x] call JSHK_contam_fnc_parseNumFilter)}) > 0) ||
	!([_timeDead] call JSHK_contam_fnc_parseNumFilter)) exitWith
{
	["All user input values (except name) must be a number only (no spaces, letters, or special characters)"] call Achilles_fnc_showZeusErrorMessage;
};

_radiusArray = _radiusArray apply {parseNumber _x};
_timeDead = parseNumber _timeDead;

[
	_orgName,
	[
		["name",_name],
		["coldrad",_cold],
		["hotRad",_hot],
		["objRad",_objRad],
		["timetodeath",_timeDead],
		["mopp",_moppLevel]
	]
] call JSHK_contam_fnc_updateAreaInfo;
