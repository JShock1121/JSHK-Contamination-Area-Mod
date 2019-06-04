/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_isWearingVest.sqf
Parameters: unit
Return: Boolean

*///////////////////////////////////////////////
params ["_unit"];
if (vest _unit in JSHK_contam_vests) then
{
	true;
}
else
{
	false;
};