/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_preInit.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////

if (isNil "JSHK_contam_DEBUG") then
{
	JSHK_contam_DEBUG = false;
};
if (isNil "JSHK_contam_DEBUG_net") then
{
	JSHK_contam_DEBUG_net = false;
};
if (isNil "JSHK_contam_areas") then
{
	JSHK_contam_areas = [];
};
if (isNil "JSHK_contam_safeAreas") then
{
	JSHK_contam_safeAreas = [];
};
if (isNil "JSHK_contam_safeVehicles") then
{
	JSHK_contam_safeVehicles = [];
};
if (isNil "JSHK_contam_godModeUnits") then
{
	JSHK_contam_godModeUnits = [];
};
if (isNil "JSHK_contam_aiDamageEnabled") then
{
	JSHK_contam_aiDamageEnabled = false;
};
if (isNil "JSHK_contam_aiAutoRecovery") then
{
	JSHK_contam_aiAutoRecovery = false;
};
if (isNil "JSHK_contam_ACE_enabled") then
{
	JSHK_contam_ACE_enabled = isClass(configFile >> "CfgPatches" >> "ace_main");
	if (JSHK_contam_ACE_enabled) then {["ACE Registered",true] call JSHK_contam_fnc_logMessage;};
};
if (isNil "JSHK_contam_gasMasks") then
{
	JSHK_contam_gasMasks = [];
};
if (isNil "JSHK_contam_maskTypeOfGear") then
{
	JSHK_contam_maskTypeOfGear = 1;
};
if (isNil "JSHK_contam_uniforms") then
{
	JSHK_contam_uniforms = [];
};
if (isNil "JSHK_contam_vests") then
{
	JSHK_contam_vests = [];
};
if (isNil "JSHK_contam_headgear") then
{
	JSHK_contam_headgear = [];
};
if (isNil "JSHK_contam_enableCough") then
{
	JSHK_contam_enableCough = true;
};
if (isNil "JSHK_contam_enableDamage") then
{
	JSHK_contam_enableDamage = true;
};
if (isNil "JSHK_contam_autoRecovery") then
{
	JSHK_contam_autoRecovery = false;
};	
if (hasInterface) then
{
	
	if (isNil "JSHK_contam_gasMasks50") then
	{
		JSHK_contam_gasMasks50 = [];
	};
	if (isNil "JSHK_contam_gasMasksTwo") then
	{
		JSHK_contam_gasMasksTwo = [];
	};
	if (isNil "JSHK_contam_gasMasksOpen") then
	{
		JSHK_contam_gasMasksOpen = [];
	};
	if (isNil "JSHK_contam_whenOverlay") then
	{
		JSHK_contam_whenOverlay = 1;
	};
	if (isNil "JSHK_contam_useMaskSound") then
	{
		JSHK_contam_useMaskSound = true;
	};
	if (isNil "JSHK_contam_staminaEffectEnabled") then
	{
		JSHK_contam_staminaEffectEnabled = true;
	};
	if (isNil "JSHK_contam_rainEffectEnabled") then
	{
		JSHK_contam_rainEffectEnabled = false;
	};
	//////////////////////////////////////////////////
	
	//////////////////////////////////////////////////
	if (isNil "JSHK_contam_enviroEffectsType") then
	{
		JSHK_contam_enviroEffectsType = -1;
	};
	if (isNil "JSHK_contam_colorFilterType") then
	{
		JSHK_contam_colorFilterType = -1;
	};
	if (isNil "JSHK_contam_activeEnviroEffects") then
	{
		JSHK_contam_activeEnviroEffects = [];
	};
	//////////////////////////////////////////////////
	if (isNil "JSHK_contam_requireDetector") then
	{
		JSHK_contam_requireDetector = true;
	};
	if (isNil "JSHK_contam_detectorEnabled") then
	{
		JSHK_contam_detectorEnabled = true;
	};
	if (isNil "JSHK_contam_detectorSoundEnabled") then
	{
		JSHK_contam_detectorSoundEnabled = true;
	};
	if (isNil "JSHK_contam_detectorArrowEnabled") then
	{
		JSHK_contam_detectorArrowEnabled = true;
	};
	//////////////////////////////////////////////////
	
	
	//////////////////////////////////////////////////
	
	/////////////////////////////////////////////////
	
	profileNamespace setVariable ["JSHK_contam_detectorPower",false];
	
	
	
	
	if (isNil "JSHK_contam_excludedUnitClasses") then
	{
		JSHK_contam_excludedUnitClasses = [];
	};
	if (isNil "JSHK_contam_excludedUnitFactions") then
	{
		JSHK_contam_excludedUnitFactions = [];
	};
};
if (isServer) then
{
	if (isNil "JSHK_contam_markerIterator") then
	{
		JSHK_contam_contamIterator = 0;
	};
	if (isNil "JSHK_contam_markerSafeIterator") then
	{
		JSHK_contam_safeIterator = 0;
	};
	if (isNil "JSHK_contam_serverInitComplete") then
	{
		JSHK_contam_serverInitComplete = false;
	};
	if (isNil "JSHK_contam_addSpawnedAI") then
	{
		JSHK_contam_addSpawnedAI = false;
	};
	
	if (isNil "JSHK_contam_excludedAIClasses") then
	{
		JSHK_contam_excludedAIClasses = [];
	};
	if (isNil "JSHK_contam_excludedAIFactions") then
	{
		JSHK_contam_excludedAIFactions = [];
	};
	
};