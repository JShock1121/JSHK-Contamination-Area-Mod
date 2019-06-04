/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_addActiveEnviroEffect.sqf
Parameters: ppEffect handle or array of handles
Return: number of effects added

*///////////////////////////////////////////////
if (count _this < 1) exitWith {};
private _c = 
{
	JSHK_contam_activeEnviroEffects pushBack _x;
	true;
} count _this;

_c;