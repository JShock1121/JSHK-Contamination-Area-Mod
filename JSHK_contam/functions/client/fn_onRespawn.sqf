/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_onRespawn.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
params ["_unit"];

_unit addEventHandler
[
	"Respawn",
	{
		params ["_unit"];
		[_unit,false] call JSHK_contam_fnc_unitInit;
		[
			"CLIENT: Respawned with %1: %2",
			[
				"JSHK_contam_gasMasks",
				"JSHK_contam_gasMasks50",
				"JSHK_contam_gasMasksTwo",
				"JSHK_contam_gasMasksOpen",
				"JSHK_contam_whenOverlay",
				"JSHK_contam_useMaskSound",
				"JSHK_contam_staminaEffectEnabled",
				"JSHK_contam_rainEffectEnabled",
				"JSHK_contam_uniforms",
				"JSHK_contam_vests",
				"JSHK_contam_headgear",
				"JSHK_contam_enviroEffectsType",
				"JSHK_contam_colorFilterType",
				"JSHK_contam_activeEnviroEffects",
				"JSHK_contam_requireDetector",
				"JSHK_contam_detectorEnabled",
				"JSHK_contam_detectorSoundEnabled",
				"JSHK_contam_detectorArrowEnabled",
				"JSHK_contam_enableDamage",
				"JSHK_contam_autoRecovery",
				"JSHK_contam_safeVehicles"
			]
		] call JSHK_contam_fnc_blockLogVars;
	}
];
