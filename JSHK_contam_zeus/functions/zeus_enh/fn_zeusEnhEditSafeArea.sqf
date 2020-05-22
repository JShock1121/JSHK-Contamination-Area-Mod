/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_zeusEditSafeArea.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
params [["_obj",objNull,[objNull]]];

if (!hasInterface || !([player] call JSHK_contam_fnc_isZeus)) exitWith {};

private _info = [];
if (!isNull _obj) then
{
	_info = [_obj,["name","radius"]] call JSHK_contam_fnc_getSafeAreaInfo;
};
if (_info isEqualTo []) exitWith {};
_info params 
[
	"_orgName",
	"_orgRad"
];

private _dialogResult =
[
	"Edit Safe Area",
	[
		["Area Name", "", _orgName,true],
		["Radius", "", str(_orgRad),true]
	]
] call Ares_fnc_showChooseDialog;

if (_dialogResult isEqualTo []) exitWith {};

_dialogResult params 
[
	"_name",
	"_rad"
];

if ([_name] call JSHK_contam_fnc_safeAreaExists) exitWith
{
	["Area name already exists!"] call Achilles_fnc_showZeusErrorMessage;
};
if !([_rad] call JSHK_contam_fnc_parseNumFilter) exitWith
{
	["All user input values (except name) must be a number only (no spaces, letters, or special characters)"] call Achilles_fnc_showZeusErrorMessage;
};

[
	_orgName,
	[
		["name",_name],
		["radius",parseNumber _rad]
	]
] call JSHK_contam_fnc_updateAreaInfo;

