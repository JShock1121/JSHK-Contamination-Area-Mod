/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_zeusAddArea.sqf
Parameters: pos and cursorObj under module
Return: none

*///////////////////////////////////////////////
params [["_pos",[0,0,0],[[]],3], ["_obj",objNull,[objNull]]];

//_diag_fn = zen_dialog_fnc_create;
//_msg_fn = zen_common_fnc_showMessage;

if (!hasInterface || !([player] call JSHK_contam_fnc_isZeus)) exitWith {};

private _onConfirm =
{
	params ["_dialogResult","_in"];
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
	_in params [["_pos",[0,0,0],[[]],3], ["_obj",objNull,[objNull]]];
	
	
	
	if ((count (_radiusArray select {!([_x] call JSHK_contam_fnc_parseNumFilter)}) > 0) ||
	!([_timeDead] call JSHK_contam_fnc_parseNumFilter)) exitWith
	{
		["All user input values (except name) must be a number only (no spaces, letters, or special characters)"] call zen_common_fnc_showMessage;
	};

	if ([_name] call JSHK_contam_fnc_areaExists) exitWith
	{
		["Area name already exists!"] call zen_common_fnc_showMessage;
	};
	if (_removeObj && isNull _obj) exitWith
	{
		["Module was not placed on an object!"] call zen_common_fnc_showMessage;
	};
	
	if (_entireMap) then
	{
		_radiusArray = [worldSize,worldSize,0];
		_removeObj = false;
	} else
	{
		_radiusArray = _radiusArray apply {parseNumber _x};
	};

	[_pos,_radiusArray,parseNumber _timeDead,_alphaMarker,[_useObj,_obj,_removeObj],_moppLevel,_name,false,true] call JSHK_contam_fnc_addArea;
};
[
	"Add Contaminated Area", 
	[
		["EDIT", "Area Name:", ""],
		["CHECKBOX","Entire Map?",false],
		["CHECKBOX","Use Object (if placed on one)",false],
		["CHECKBOX","Remove Area on Object Destroy",false],
		["EDIT","Cold Zone Radius","100"],
		["EDIT","Hot Zone Radius","50"],
		["EDIT","Object Zone Radius","5"],
		["EDIT","Time to Death (in secs)","100"],
		["COMBO","Show Map Marker(s)",[[0,1,-2,-1],["None","Basic","Transparent","Warning Area"],0]],
		["COMBO","MOPP Level",[[0,1,2,3,4],["No MOPP","MOPP 1 (mask only)","MOPP 2 (mask and uniform)","MOPP 3 (mask/uniform/pack)","MOPP 4 (mask/uniform/pack/vest)"],0]]
	],
	_onConfirm,
	{},
	_this
] call zen_dialog_fnc_create;

