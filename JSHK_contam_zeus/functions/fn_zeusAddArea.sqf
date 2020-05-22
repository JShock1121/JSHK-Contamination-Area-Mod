/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_zeusAddArea.sqf
Parameters: pos and cursorObj under module
Return: none

*///////////////////////////////////////////////
params [["_pos",[0,0,0],[[]],3], ["_obj",objNull,[objNull]]];

if (!hasInterface || !([player] call JSHK_contam_fnc_isZeus)) exitWith {};
if (JSHK_contam_zeus_mod_fn) exitWith {_this call JSHK_contam_fnc_zeusEnhAddArea};

private _dialogResult =
[
	"Add Contaminated Area",
	[
		["Area Name", "", "",true],
		["Entire Map?", ["No","Yes"],0,true],
		["Use Object (if placed on one)", ["Yes","No"], 1,true],
		["Remove Area on Object Destroy", ["Yes","No"], 1,true],
		["Cold Zone Radius", "", "100",true],
		["Hot Zone Radius", "", "50",true],
		["Object Zone Radius", "", "5",true],
		["Time to Death (in secs)", "", "100",true],
		["Show Map Marker(s)", ["None","Basic","Transparent","Warning Area"],0,true],
		["MOPP Level", ["No MOPP","MOPP 1 (mask only)","MOPP 2 (mask and uniform)","MOPP 3 (mask/uniform/pack)","MOPP 4 (mask/uniform/pack/vest)"],0,true]
	]
] call Ares_fnc_showChooseDialog;

if (_dialogResult isEqualTo []) exitWith{};

_dialogResult params 
[
	"_name",
	"_entireMap",
	"_useObj",
	"_removeObj",
	"_cold","_hot","_objRad",
	"_timeDead",
	"_alphaMarker",
	"_mopplevel"
];

private _radiusArray = [_cold,_hot,_objRad];

if ((count (_radiusArray select {!([_x] call JSHK_contam_fnc_parseNumFilter)}) > 0) ||
	!([_timeDead] call JSHK_contam_fnc_parseNumFilter)) exitWith
{
	["All user input values (except name) must be a number only (no spaces, letters, or special characters)"] call Achilles_fnc_showZeusErrorMessage;
};

if ([_name] call JSHK_contam_fnc_areaExists) exitWith
{
	["Area name already exists!"] call Achilles_fnc_showZeusErrorMessage;
};
_removeObj = (_removeObj == 0);
if (_removeObj && isNull _obj) exitWith
{
	["Module was not placed on an object!"] call Achilles_fnc_showZeusErrorMessage;
};

if (_entireMap == 1) then
{
	_radiusArray = [worldSize,worldSize,0];
	_removeObj = false;
} else
{
	_radiusArray = _radiusArray apply {parseNumber _x};
};
_useObj = (_useObj == 0);
switch (_alphaMarker) do
{
	case 2: {_alphaMarker = -2};
	case 3: {_alphaMarker = -1};
};
[_pos,_radiusArray,parseNumber _timeDead,_alphaMarker,[_useObj,_obj,_removeObj],_moppLevel,_name,false,true] call JSHK_contam_fnc_addArea;

