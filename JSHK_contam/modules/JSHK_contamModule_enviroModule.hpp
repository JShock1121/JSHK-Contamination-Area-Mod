class JSHK_contamModule_enviroModule: Module_F
{
	scope = 2;
	displayName = "Environmental Effects Settings";
	category = "JSHK_contamModule_cat";
	icon = "\JSHK_contam\data\icon_ca.paa";
	
	function = "JSHK_contamModule_fnc_moduleEnviro";
	functionPriority = 1;
	isGlobal = 2;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	
	class Arguments: ArgumentsBaseUnits
	{
		/*class JSHK_contamModuleVar_useEnvironEffects
		{
			displayName = "Type of Effect";
			description = "Post process effect once in area";
			typeName = "NUMBER";
			class values
			{
				class none {name = "None"; value = -1; default = -1;};
				class normal {name = "Standard Effect"; value = 0; default = -1;};
				class distorted {name = "Distorted"; value = 1; default = -1;};
				class haze {name = "Haze Effect"; value = 2; default = -1;};
				class haze2 {name = "Haze Effect #2"; value = 3; default = -1;};
			};
		};
		class JSHK_contamModuleVar_useColorFilter
		{
			displayName = "Color Filter";
			description = "Color filter on post process";
			typeName = "NUMBER";
			class values
			{
				class none {name = "None"; value = -1; default = -1;};
				class film {name = "Film/Brown Filter"; value = 0; default = -1;};
				class red {name = "Red Filter"; value = 1; default = -1;};
				class mustard {name = "Mustard/Yellow Filter"; value = 2; default = -1;};
				class chlorine {name = "Chlorine/Blue Filter"; value = 3; default = -1;};
			};
		};
		class JSHK_contamModuleVar_rainEffectEnabled
		{
			displayName = "Rain on Mask";
			description = "Enable a rain effect on the mask when it's raining";
			typeName = "BOOL";
			defaultValue = true;
		};*/
	};
	
	class ModuleDescription: ModuleDescription
	{
		description = "JSHK Contamination Environment Effects Module";
		sync[] = {};
	};
};