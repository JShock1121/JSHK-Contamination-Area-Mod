/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_isWearingUniform.sqf
Parameters: unit
Return: Boolean

*///////////////////////////////////////////////
params ["_unit"];
if ((uniform _unit) in JSHK_contam_uniforms) then
{
	true;
}
else
{
	false;
};