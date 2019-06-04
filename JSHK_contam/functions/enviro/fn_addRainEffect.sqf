/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_addRainEffect.sqf
Parameters: unit
Return: none

*///////////////////////////////////////////////
params [["_unit",objNull,[objNull]]];
if (isNull _unit) exitWith {};
_wet = ppEffectCreate ["WetDistortion",800];
_wet ppEffectEnable true;
_wet ppEffectAdjust [-10,0,0.03,5,5,5,5,-1,-1,-1,-1,2,2,5,5];
_dyna = ppEffectCreate ["DynamicBlur",1000];
_dyna ppEffectEnable true;
_dyna ppEffectAdjust [0.36];
[_wet,_dyna] ppEffectCommit 0;
_unit setVariable ["JSHK_contam_rainPP",[_wet,_dyna]];