/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_removeEnviroEffects.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
#include "\JSHK_contam\functions\enviro\macros.hpp"

params ["_in"];
if (JSHK_contam_activeEnviroEffects isEqualTo []) exitWith {};

private _step = [_in] call JSHK_contam_fnc_getStep;

{
	_x params ["_handle","_type"];
	private _data = [_type] call JSHK_contam_fnc_typeEffect;
	_handle ppEffectAdjust [_data,_step] call JSHK_contam_fnc_applyStep;
	_handle ppEffectCommit 2;
	if (_in == 0) then 
	{
		_handle ppEffectEnable false;
		waitUntil {!(ppEffectEnabled _handle)};
		ppEffectDestroy _handle;
	};
} count JSHK_contam_activeEnviroEffects;

/*
{
	_h = [_x] spawn
	{
		params ["_in"];
		_in ppEffectEnable false;
		_in ppEffectCommit 2;
	};
	waitUntil {scriptDone _h};
	ppEffectDestroy _x;
} count JSHK_contam_activeEnviroEffects;
*/