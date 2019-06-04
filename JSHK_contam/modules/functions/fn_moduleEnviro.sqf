/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_moduleEnviro.sqf
Parameters: logic, list of units, boolean
Return: none

*///////////////////////////////////////////////
params ["_logic","_units","_activated"];

//JSHK_contam_enviroEffectsType = _logic getVariable ["JSHK_contamModuleVar_useEnvironEffects",-1];
//JSHK_contam_colorFilterType = _logic getVariable ["JSHK_contamModuleVar_useColorFilter",-1];
JSHK_contam_rainEffectEnabled = _logic getVariable ["JSHK_contamModuleVar_rainEffectEnabled",true];



_logic setVariable ["JSHK_contamModule_initCompleted",true];