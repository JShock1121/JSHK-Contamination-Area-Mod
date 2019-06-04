/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_safeAreaExists.sqf
Parameters: string or object
Return: bool

*///////////////////////////////////////////////
params [["_areaName","",["",objNull]]];
private _typeInput = typeName _areaName;
private _return = true;
if (_typeInput == "OBJECT") then
{
	if (isNull _areaName) exitWith { _return = false; };
	private _in = _areaName in JSHK_contam_safeAreas;
	if (!_in) exitWith { _return = false; };
} else
{
	if (_typeInput == "STRING") then
	{
		if (_areaName == "") exitWith 
		{
			["fn_safeAreaExists: Area name provided was empty or nil."] call JSHK_contam_fnc_logMessage;
			_return = false;
		};
		private _areaObj = [_areaName] call JSHK_contam_fnc_findSafeArea;
		if (isNull _areaObj) exitWith { _return = false; };
	};
};
_return;