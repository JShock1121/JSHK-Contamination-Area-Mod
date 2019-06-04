/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_affectAILoop.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
if !(isServer) exitWith {};

private _getAI = 
{ 
	allUnits select 
	{
		!isPlayer _x &&
		!(_x getVariable ["JSHK_contam_aiAdded",false])
	};
};

private _ai = call _getAI;

while {true} do
{
	{
		[_x,false] spawn JSHK_contam_fnc_unitInit;
		_x setVariable ["JSHK_contam_aiAdded",true];
		sleep 0.005;
		false;
	} count _ai;
	if (!JSHK_contam_addSpawnedAI) exitWith {};
	
	_ai = call _getAI;
	sleep 0.5;
};