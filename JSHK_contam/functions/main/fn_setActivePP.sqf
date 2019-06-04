/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_setActivePP.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
params ["_hndl","_type","_unit"];
private ["_arr","_var"];
_arr = [];
_arr pushBack _type;
_arr pushBack _hndl;

_var = (_unit getVariable ["JSHK_contam_activePP_Effects",[]]);
_var pushBack _arr;
_unit setVariable ["JSHK_contam_activePP_Effects",_var];