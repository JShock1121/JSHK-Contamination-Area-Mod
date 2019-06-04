class JSHK_contamModule_maskModule: Module_F
{
	scope = 2;
	displayName = "Mask Settings";
	category = "JSHK_contamModule_cat";
	icon = "\JSHK_contam\data\icon_ca.paa";
	
	function = "JSHK_contamModule_fnc_moduleMask";
	functionPriority = 1;
	isGlobal = 2;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	
	class Arguments: ArgumentsBaseUnits
	{
		/*class JSHK_contamModuleVar_headgear
		{
			displayName = "Types of Headgear";
			description = "Classnames of headgear (seperate by commas with no quotations)";
			typeName = "STRING";
			defaultValue = "";
		};*/
		class JSHK_contamModuleVar_gasMasks50
		{
			displayName = "M50 Type Masks";
			description = "Classnames of masks that will have an M50 style overlay (seperate by commas) *Note: This will enable an M50 overlay";
			typeName = "STRING";
			defaultValue = "";
		};
		class JSHK_contamModuleVar_gasMasksTwo
		{
			displayName = "Two-eyed Masks";
			description = "Classnames of masks that will have two-eyed style overlay (seperate by commas) *Note: This will enable an Two-eyed overlay";
			typeName = "STRING";
			defaultValue = "";
		};
		class JSHK_contamModuleVar_gasMasksOpen
		{
			displayName = "Open-faced Masks";
			description = "Classnames of masks that will have an open-face style overlay (seperate by commas) *Note: This will enable an Open style overlay";
			typeName = "STRING";
			defaultValue = "";
		};
		class JSHK_contamModuleVar_useMaskOverlay
		{
			displayName = "Use Mask Overlay";
			description = "Enable/disable mask effect overlay for first person, or both first and third";
			typeName = "NUMBER";
			class values
			{
				class disable {name = "Disable"; value = 0; default = 1;};
				class firstOnly {name = "First Person Only"; value = 1; default = 1;};
				class both {name = "Both First and Third Person"; value = 2; default = 1;};
			};
		};
		class JSHK_contamModuleVar_typeOfGear
		{
			displayName = "Head/Goggles";
			description = "Choose whether defined headgear or googles (in the areas above) is considered the mask on evaluation.";
			typeName = "NUMBER";
			class values
			{	
				class eyes {name = "Use Goggles as Mask"; value = 1; default = 1;};
				class head {name = "Use Headgear as Mask"; value = 0; default = 1;};
			};
		};
		class JSHK_contamModuleVar_useMaskSound
		{
			displayName = "Mask Sound";
			description = "Enable default mask sound";
			typeName = "BOOL";
			defaultValue = true;
		};
		class JSHK_contamModuleVar_maskSoundStamina
		{
			displayName = "Stamina Effect";
			description = "Enable the use of the stamina effect (faster breathing with lower stamina)";
			typeName = "BOOL";
			defaultValue = false;
		};
		class JSHK_contamModuleVar_includeJSHKMask
		{
			displayName = "Include JSHK Masks";
			description = "Include the masks contained within the JSHK Contamination Gear addon (masks only)";
			typeName = "BOOL";
			defaultValue = false;
		};
	};
	
	class ModuleDescription: ModuleDescription
	{
		description = "JSHK Contamination Mask Settings Module";
		sync[] = {};
	};
};