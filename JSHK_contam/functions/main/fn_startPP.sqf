/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_startPP.sqf
Parameters: type of post-process effect
Return: none

*///////////////////////////////////////////////
params ["_unit","_type"];
private ["_arr","_pp","_var"];
_arr = [];
switch (toLower _type) do
{
	case "blur": 
	{
		["DynamicBlur",400,_unit] spawn JSHK_contam_fnc_ppBlur;
	};
	case "abberation": 
	{
		["ChromAberration",500,_unit] spawn JSHK_contam_fnc_ppAbber;
	};
	case "wet":
	{
		["WetDistortion",600,_unit] spawn JSHK_contam_fnc_ppWet;
	};
	/*case "enviro":
	{
		[] call JSHK_contam_fnc_addEnviroEffects;
	};*/
	default {};
};