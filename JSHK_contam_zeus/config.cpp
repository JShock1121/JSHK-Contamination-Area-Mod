class CfgPatches
{
	class JSHK_contam_zeus
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = { "JSHK_contam" };
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
	class JSHK_contamModuleZeus_cat: NO_CATEGORY
	{
		displayName = "JSHK Contam Zeus";
	};
};
class CfgFunctions
{
	#include "\JSHK_contam_zeus\cfgFunctions.hpp"
};
