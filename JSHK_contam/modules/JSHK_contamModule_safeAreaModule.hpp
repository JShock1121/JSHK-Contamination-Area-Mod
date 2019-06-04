class JSHK_contamModule_safeAreaModule: Module_F
{
	scope = 2;
	displayName = "Add Safe Area";
	category = "JSHK_contamModule_cat";
	icon = "\JSHK_contam\data\icon_ca.paa";
	
	function = "JSHK_contamModule_fnc_moduleSafeAreas";
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
			displayName = "Name of Safe Area";
			description = "Enter the name for the safe area, be sure the name contains no spaces, underscores are fine";
			typeName = "STRING";
			defaultValue = "";
		};
		class JSHK_contamModuleVar_useModulePos
		{
			displayName = "Use module position";
			description = "Use the module as a center point for a safe area";
			typeName = "BOOL";
			defaultValue = true;
		};
		class JSHK_contamModuleVar_radius
		{
			displayName = "Radius of Safe Zone";
			description = "Default: 100 meters";
			typeName = "NUMBER";
			defaultValue = 100;
		};
		class JSHK_contamModuleVar_showMarker
		{
			displayName = "Show Zone on Map";
			description = "Create a marker on the map to show the radius of the zone";
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
				class warning {name = "Safe Zone Marker"; value = -1; default = 1;};
			};
		};
	};
	
	class ModuleDescription: ModuleDescription
	{
		description = "JSHK Contamination Safe Zone Module";
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