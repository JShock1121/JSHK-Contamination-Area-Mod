/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_isWearingMask.sqf
Parameters: unit
Return: Boolean

*///////////////////////////////////////////////
params ["_unit"];
if ((headgear _unit) in JSHK_contam_gasMasks || 
		(goggles _unit) in JSHK_contam_gasMasks) then
{
	true;
}
else
{
	false;
};