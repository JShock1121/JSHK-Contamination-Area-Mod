class JSHK_contam_addon
{
	tag = "JSHK_contam";
	class Contamination_main
	{
		file = "\JSHK_contam\functions\main";
		class damageCondLoop {};
		class damage {};
		class aceDamage {};
		class vanillaDamage {};
		class lucidAnim {};
		class recover {};
		class playCough {};
		
		class maskOnLoop {};
		class maskSound {};
		
		class detectorSoundLoop {};
		class beep {};
		
		class startPP {};
		class stopPP {};
		class ppBlur {};
		class ppAbber {};
		class ppWet {};
		class setActivePP {};
		
		class unitInit {};
	};
	
	class Contamination_client
	{
		file = "\JSHK_contam\functions\client";
		class onRespawn {};
		class requestUpdate {};
		class requestExec {};
		class checkCameraStatus {};
		class addOnEachFrame {};
		class detectorKeyHandle {};
	};
	
	class Contamination_server
	{
		file = "\JSHK_contam\functions\server";
		class updateAllClients {};
		class updateClient {};
		class assessModules {};
		class addArea {};
		class addSafeArea {};
		class addSafeVehicle {};
		class removeArea {};
		class removeSafeArea {};
		class removeSafeVehicle {};
		class affectAILoop {};
		class updateAreaInfo {};
		class updateSafeAreaInfo {};
	};
	
	class Contamination_general
	{
		file = "\JSHK_contam\functions\general";
		class preInit {preInit = 1;};
		class postInit {postInit = 1;};
		class logMessage {};
		class blockLogVars {};
		class addPVEH {};
		class compare {};
		class strToArray {};
		class parseNumFilter {};
	};
	
	class Contamination_accessory
	{
		file = "\JSHK_contam\functions\accessory";
		class getAreaInfo {};
		class inArea {};
		class findArea {};
		class areaExists {};
		class nearestArea {};
		class distanceFromArea {};
		class inColdZone {};
		class inHotZone {};
		class inObjZone {};
		
		
		class getSafeAreaInfo {};
		class inSafeArea {};
		class findSafeArea {};
		class safeAreaExists {};
		class distanceFromSafeArea {};
		class nearestSafeArea {};
		
		class inSafeVeh {};
		class safeVehicleExists {};
		
		class getStamina {};
		
		class hasAllGear {};
		class isWearingMask {};
		class isWearingUniform {};
		class isWearingVest {};
		class isWearingHeadgear {};
		
		class hasDetector {};
	};
	class Contamination_ui
	{
		file = "\JSHK_contam\functions\ui";
		class addMaskOverlay {};
		class removeMaskOverlay {};
		class hasMaskOverlay {};
		class getMaskOverlayType {};
		
		class openDetector {};
		class closeDetector {};
		class powerDetector {};
		class soundDetector {};
		class detectorOn {};
		class detectorPowerOn {};
		class updateDetector {};
	};
	
	class Contamination_enviro
	{
		file = "\JSHK_contam\functions\enviro";
		class addEnviroEffect {};
		class addColorFilter {};
		class removeEnviroEffect {};
		class addActiveEnviroEffects {};
		
		class getStep {};
		class typeEffect {};
		class applyStep {};
		
		class isRaining {};
		class addRainEffect {};
		class removeRainEffect {};
		class rainLoop {};
		class rainEffectApplied {};
		class underCover {};
	};
};