/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_zeusRemoveArea.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
params [["_pos",[0,0,0],[[]],3], ["_obj",objNull,[objNull]]];

if (!hasInterface || !([player] call JSHK_contam_fnc_isZeus)) exitWith {};

private _onConfirm =
{
	params ["_dialogResult","_in"];
	_dialogResult params ["_name"];
	
	if (_name == "") exitWith {};
	
	private _area = [_name] call JSHK_contam_fnc_findArea;
	if (isNull _area) exitWith {};

	[_area] call JSHK_contam_fnc_removeArea;
};

private _areaNames = [];
if (count JSHK_contam_areas > 0) then
{
	_areaNames = JSHK_contam_areas apply {[_x,"name"] call JSHK_contam_fnc_getAreaInfo};
} else
{
	_areaNames pushBack "";
};

if (_areaNames isEqualTo []) exitWith {};

[
	"Remove Contaminated Area", 
	[
		["COMBO","Areas",[_areaNames,_areaNames,0]]
	],
	_onConfirm,
	{},
	_this
] call zen_dialog_fnc_create;
