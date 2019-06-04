class JSHK_contamModule_vehicleModule: Module_F
{
	scope = 2;
	displayName = "Vehicle Settings";
	category = "JSHK_contamModule_cat";
	icon = "\JSHK_contam\data\icon_ca.paa";
	
	function = "JSHK_contamModule_fnc_moduleVehicles";
	functionPriority = 1;
	isGlobal = 2;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	
	class Arguments: ArgumentsBaseUnits
	{
		class Units: Units {};
		class JSHK_contamModuleVar_vehicles
		{
			displayName = "Types of Vehicles";
			description = "Classnames or variable names of vehicles that are considered safe to enter an area (seperate by commas with no quotations) *Note: All synced vehicles will be included as well";
			typeName = "STRING";
			defaultValue = "";
		};
	};
	
	class ModuleDescription: ModuleDescription
	{
		description = "JSHK Contamination Vehicle Settings Module";
		sync[] = {};
	};
};