/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_addColorFilter.sqf
Parameters: number, number
Return: ppeffect handle

*///////////////////////////////////////////////
#include "\JSHK_contam\functions\enviro\macros.hpp"
params [["_type",-1,[0]],["_in",1,[0]]];

private _step = [_in] call JSHK_contam_fnc_getStep;
private _color = nil;
private _arr = [];
switch (_type) do 
{
	case 0: {_color = "brown"; _arr = [JSHK_CONTAM_C_FILM_F,_step] call JSHK_contam_fnc_applyStep;};//film
	case 1: {_color = "red"; _arr = [JSHK_CONTAM_C_RED_F,_step] call JSHK_contam_fnc_applyStep;};//red
	case 2: {_color = "yellow"; _arr = [JSHK_CONTAM_C_MUS_F,_step] call JSHK_contam_fnc_applyStep;};//mustard
	case 3: {_color = "blue"; _arr = [JSHK_CONTAM_C_CHLOR_F,_step] call JSHK_contam_fnc_applyStep;};//chlorine
	default {};
};

private _h = ppEffectCreate ["colorCorrections",800];
_h ppEffectAdjust _arr;

[_h,_color];