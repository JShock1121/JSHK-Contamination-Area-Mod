class JSHK_contamModule_areaModule: Module_F
{
	scope = 2;
	displayName = "Add Contam Area";
	category = "JSHK_contamModule_cat";
	icon = "\JSHK_contam\data\icon_ca.paa";
	
	function = "JSHK_contamModule_fnc_moduleAreas";
	functionPriority = 1;
	isGlobal = 2;
	isTriggerActivated = 1;
	isDisposable = 0;
	is3DEN = 0;
	
	//curatorInfoType = "RscDisplayAttributecontamAreaModule";
	
	class Arguments: ArgumentsBaseUnits
	{
		class Units: Units {};
		class JSHK_contamModuleVar_name
		{
			displayName = "Name of Area";
			description = "Enter the name for the area, be sure the name contains no spaces, underscores are fine";
			typeName = "STRING";
			defaultValue = "";
		};
		class JSHK_contamModuleVar_entireMap
		{
			displayName = "Entire Map";
			description = "The entire map is a contaminated zone";
			typeName = "BOOL";
			defaultValue = false;
		};
		class JSHK_contamModuleVar_useModulePos
		{
			displayName = "Use module position";
			description = "Use the module as a center point for an area";
			typeName = "BOOL";
			defaultValue = true;
		};
		class JSHK_contamModuleVar_deleteAreaOnObjDestroy
		{
			displayName = "Delete on Destroy";
			description = "Delete contam area linked to object upon object destruction (only to syncronized objects)";
			typeName = "BOOL";
			defaultValue = true;
		};
		class JSHK_contamModuleVar_radius
		{
			displayName = "Cold Zone Radius";
			description = "Radius of detectable but non-deadly area (Default: 100 meters)";
			typeName = "NUMBER";
			defaultValue = 100;
		};
		class JSHK_contamModuleVar_hotRadius
		{
			displayName = "Hot Zone Radius";
			description = "Radius of deadly area within the overall zone (Default: 50 meters)";
			typeName = "NUMBER";
			defaultValue = 50;
		};
		class JSHK_contamModuleVar_objRadius
		{
			displayName = "Object Zone Radius";
			description = "Radius of originating object detection, only affects syncronized objects (Default: 5 meters)";
			typeName = "NUMBER";
			defaultValue = 5;
		};
		class JSHK_contamModuleVar_timeToDeath
		{
			displayName = "Time to Death";
			description = "Time in seconds before player dead (default: 100) *Note: With ACE enabled it will put player into cardiac arrest";
			typeName = "NUMBER";
			defaultValue = 100;
		};
		class JSHK_contamModuleVar_showMarker
		{
			displayName = "Show Area on Map";
			description = "Create a marker on the map to show the radius of the area";
			typeName = "BOOL";
			defaultValue = false;
		};
		class JSHK_contamModuleVar_alphaMarker
		{
			displayName = "Type of Marker";
			description = "Type of marker displayed on map";
			typeName = "NUMBER";
			class values
			{
				class none {name = "No Marker"; value = 0; default = 1;};
				class transparent {name = "Transparent Marker"; value = -2; default = 1;};
				class basic {name = "Basic Marker"; value = 1; default = 1;};
				class warning {name = "Warning Area Marker"; value = -1; default = 1;};
			};
		};
		class JSHK_contamModuleVar_MOPPlevel
		{
			displayName = "MOPP Level";
			description = "What gear is required for this area *Note: MOPP 4 is dependent on the headgear/goggles setting in the Mask Settings Module";
			typeName = "NUMBER";
			class values
			{
				class none {name = "No Gear"; value = 0; default = 1;};
				class one {name = "MOPP Level One (Mask Only)"; value = 1; default = 1;};
				class two {name = "MOPP Level Two (Mask and Uniform)"; value = 2; default = 1;};
				class three {name = "MOPP Level Three (Mask, Uniform, Vest)"; value = 3; default = 1;};
				//class four {name = "MOPP Level Four (Mask, Uniform, Vest, Headgear/Goggles)"; value = 4; default = 1;};
			};
		};
	};
	
	class ModuleDescription: ModuleDescription
	{
		description = "JSHK Contamination Area Module";
		sync[] = {"EmptyDetector"};
		
		class EmptyDetector
		{
			position = 1;
			direction = 0;
			optional = 1;
			duplicate = 1;
			synced[] = {"EmptyDetector"};
		};
	};
};