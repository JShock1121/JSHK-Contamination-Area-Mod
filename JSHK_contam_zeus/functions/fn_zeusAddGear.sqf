/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_zeusAddGear.sqf
Parameters: pos and cursorObj under module
Return: none

*///////////////////////////////////////////////
params [["_pos",[0,0,0],[[]],3], ["_obj",objNull,[objNull]]];

if (!hasInterface || !([player] call JSHK_contam_fnc_isZeus)) exitWith {};
if (isNull _obj) exitWith {};

private _leadEle = ["None"];
private _masks = [_leadEle,JSHK_contam_gasMasks,1] call BIS_fnc_arrayInsert;
private _uni = [_leadEle,JSHK_contam_uniforms,1] call BIS_fnc_arrayInsert;
private _vests = [_leadEle,JSHK_contam_vests,1] call BIS_fnc_arrayInsert;
private _dialogResult =
[
	"Add Gear",
	[
		["Mask (headgear/goggles)",_masks,0,true],
		["Uniform/Suit",_uni,0,true],
		["Vest",_vests,0,true],
		["Add to Group",["No","Yes"],0,true]
	]
] call Ares_fnc_showChooseDialog;

if (_dialogResult isEqualTo []) exitWith{};

_dialogResult params 
[
	"_mask",
	"_uniform",
	"_vest",
	"_addGrp"
];

/*
	check type of class for mask
	remove current helment/goggle
	add new mask
	
	store uniform info
	remove uniform
	add new uni
	add back stuff
	
	store vest info
	remove vest
	add vest
	add back stuff
*/

