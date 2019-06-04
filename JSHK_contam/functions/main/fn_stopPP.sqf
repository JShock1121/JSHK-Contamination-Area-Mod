/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_stopPP.sqf
Parameters: type of post-process effect
Return: number of PP effects removed

*///////////////////////////////////////////////
params ["_unit"];
private ["_c"];
_c = 
{
	_x params ["_type","_pp"];
	switch (toLower _type) do
	{
		case "dynamicblur":
		{
			_pp ppEffectEnable false;
			ppEffectDestroy _pp;
		};
		case "chromaberration":
		{
			_pp ppEffectEnable false;
			ppEffectDestroy _pp;
		};
		case "wetdistortion":
		{
			_pp ppEffectEnable false;
			ppEffectDestroy _pp;
		};
	};
	_pp ppEffectEnable false;
	ppEffectDestroy _pp;
	true;
} count (_unit getVariable ["JSHK_contam_activePP_Effects",[]]);

_c;