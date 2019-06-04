/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_zeusAddSafeArea.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
params [["_pos",[0,0,0],[[]],3], ["_obj",objNull,[objNull]]];

if (!hasInterface || !([player] call JSHK_contam_fnc_isZeus)) exitWith {};


private _dialogResult =
[
	"Add Safe Area",
	[
		["Area Name", "", "",true],
		["Radius", "", "100",true],
		["Show Map Marker(s)", ["None","Basic","Transparent","Safe Area"],0,true]
	]
] call Ares_fnc_showChooseDialog;

if (_dialogResult isEqualTo []) exitWith {};

_dialogResult params 
[
	"_name",
	"_rad",
	"_alphaMarker"
];

if ([_name] call JSHK_contam_fnc_safeAreaExists) exitWith
{
	["Area name already exists!"] call Achilles_fnc_showZeusErrorMessage;
};
if !([_rad] call JSHK_contam_fnc_parseNumFilter) exitWith
{
	["All user input values (except name) must be a number only (no spaces, letters, or special characters)"] call Achilles_fnc_showZeusErrorMessage;
};

switch (_alphaMarker) do
{
	case 2: {_alphaMarker = -2};
	case 3: {_alphaMarker = -1};
};
[_pos,parseNumber _rad,_alphaMarker,_name,false,true] call JSHK_contam_fnc_addSafeArea;
