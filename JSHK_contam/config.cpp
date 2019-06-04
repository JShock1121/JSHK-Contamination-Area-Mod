class CfgPatches
{
	class JSHK_contam
	{
		units[] = 
		{
			"JSHK_contamModule_areaModule",
			"JSHK_contamModule_safeAreaModule",
			"JSHK_contamModule_playerSettingsModule",
			"JSHK_contamModule_gearSettingsModule",
			"JSHK_contamModule_aiSettingsModule",
			"JSHK_contamModule_enviroModule",
			"JSHK_contamModule_debugModule",
			"JSHK_contamModule_detectorModule",
			"JSHK_contamModule_removeAreaModule",
			"JSHK_contamModule_removeSafeAreaModule",
			"JSHK_contamModule_maskModule",
			"JSHK_contamModule_vehicleModule",
			
			"JSHK_contam_dummyObject"
			
			//"JSHK_contamModule_ZEUS_moduleBase",
			//"JSHK_contamModule_ZEUS_areaModule",
			//"JSHK_contamModule_ZEUS_removeAreaModule",
			//"JSHK_contamModule_ZEUS_safeAreaModule",
			//"JSHK_contamModule_ZEUS_removeSafeAreaModule"
		};
		weapons[] = {"JSHK_contam_detector"};
		requiredAddons[] = 
		{
			"A3_UI_F",
			"A3_UI_F_Curator",
			"A3_Functions_F",
			"A3_Functions_F_Curator",
			"A3_Modules_F",
			"A3_Modules_F_Curator",
			"A3_Structures_F_Items_Food",
			"A3_Weapons_F"
		};
		author = "J. Shock";
		authorUrl = "https://forums.bistudio.com/profile/858605-jshock/";
		version = 1.0.0;
		versionStr = "1.0.0";
		versionAr[] = {1,0,0};
	};
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class JSHK_contamModule_cat: NO_CATEGORY
	{
		displayName = "JSHK Contam";
	};
};
class CfgVehicles
{
	#include "\JSHK_contam\cfgVehicles.hpp"
};
class CfgWeapons
{
	#include "\JSHK_contam\cfgWeapons.hpp"
};
class CfgFunctions
{
	#include "\JSHK_contam\cfgFunctions.hpp"
	#include "\JSHK_contam\modules\functions\cfgFunctions.hpp"
	//#include "\JSHK_contam\modules\zeus\functions\cfgFunctions.hpp"
};
class CfgSounds
{
	#include "\JSHK_contam\cfgSounds.hpp"
};

#include "\JSHK_contam\dialog\dialogInfo.hpp"
