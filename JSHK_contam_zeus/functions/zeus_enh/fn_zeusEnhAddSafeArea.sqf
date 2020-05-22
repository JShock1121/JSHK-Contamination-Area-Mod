/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_zeusAddSafeArea.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
params [["_pos",[0,0,0],[[]],3], ["_obj",objNull,[objNull]]];

if (!hasInterface || !([player] call JSHK_contam_fnc_isZeus)) exitWith {};

private _onConfirm =
{
	params ["_dialogResult","_in"];
	_dialogResult params
	[
		"_name",
		"_rad",
		"_alphaMarker"
	];
	_in params [["_pos",[0,0,0],[[]],3], ["_obj",objNull,[objNull]]];
	
	if ([_name] call JSHK_contam_fnc_safeAreaExists) exitWith
	{
		["Area name already exists!"] call zen_common_fnc_showMessage;
	};
	if !([_rad] call JSHK_contam_fnc_parseNumFilter) exitWith
	{
		["All user input values (except name) must be a number only (no spaces, letters, or special characters)"] call zen_common_fnc_showMessage;
	};

	[_pos,parseNumber _rad,_alphaMarker,_name,false,true] call JSHK_contam_fnc_addSafeArea;
};
[
	"Add Contaminated Area", 
	[
		["EDIT", "Safe Area Name:", ""],
		["EDIT","Cold Zone Radius","100"],
		["COMBO","Show Map Marker(s)",[[0,1,-2,-1],["None","Basic","Transparent","Safe Area"],0]]
	],
	_onConfirm,
	{},
	_this
] call zen_dialog_fnc_create;
