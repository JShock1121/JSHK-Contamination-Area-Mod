/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_isWearingBackpack.sqf
Parameters: unit
Return: Boolean

*///////////////////////////////////////////////
params ["_unit"];
if ((backpack _unit) in JSHK_contam_packs) then
{
	true;
}
else
{
	false;
};