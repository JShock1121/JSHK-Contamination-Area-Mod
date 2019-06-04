#define SCALE 1.25
#define DIV(x,y) x/y
#define QUOTE(n) #n
#define DIV_QUOTE(x,y) QUOTE(DIV(x,y))
class rscContaminationDialog
{
	idd=54701;
	movingEnable = 1;
	moving = 1;
	enableSimulation = 1;
	fadein=0;
	duration = 1e+011;
	fadeout=0;
	onLoad= "";


	controlsBackground[]=
	{
		
	};
	controls[]=
	{
		rscDetectorMain,
		rscDetectorDirArrow,
		rscTimeText,
		rscContamText,
		rscDetectorScreen,
		rscPowerBtn,
		rscSoundIcon,
		rscSoundBtn
	};
	objects[]=
	{
		
	};

	class rscDetectorMain: RscPicture
	{
		idc = 1;
		colorBackground[] = {0,0,0,1};
		colorText[] = {1,1,1,1};
		moving = 1;
		text = "\JSHK_contam\data\detectorBack.paa";
		x = (0* safezoneW + safezoneX)/SCALE;
		y = (0 * safezoneH + safezoneY)/SCALE;
		w = (0.75 * safezoneW)/SCALE;
		h = (1 * safezoneH)/SCALE;
	};
	class rscDetectorDirArrow: RscPicture
	{
		idc = 2;
		colorBackground[] = {0,0,0,1};
		colorText[] = {1,1,1,1};
		moving = 1;
		text = "\JSHK_contam\data\detectorArrow.paa";
		x = (0.291* safezoneW + safezoneX)/SCALE;
		y = (0.54* safezoneH + safezoneY)/SCALE;
		w = (0.15 * safezoneW)/SCALE;
		h = (0.2* safezoneH)/SCALE;
	};
	class rscTimeText: RscStructuredText
	{
		idc = 3;
		colorText[] = {1,1,1,1};
		moving = 1;
		x = (0.3 * safezoneW + safezoneX)/SCALE;
		y = (0.24 * safezoneH + safezoneY)/SCALE;
		w = (0.2 * safezoneW)/SCALE;
		h = (0.02 * safezoneH)/SCALE;
		text = "";
		size = DIV_QUOTE((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.175),SCALE);
	};
	class rscSoundIcon: RscPictureKeepAspect
	{
		idc = 8;
		colorBackground[] = {0,0,0,1};
		colorText[] = {1,0,0,1};
		moving = 1;
		x = (0.301 * safezoneW + safezoneX)/SCALE;
		y = (0.24 * safezoneH + safezoneY)/SCALE;
		w = (0.2 * safezoneW)/SCALE;
		h = (0.0201 * safezoneH)/SCALE;
		text = "JSHK_contam\data\soundIcon.paa";
	};
	class rscContamText: RscStructuredText
	{
		idc = 4;
		colorText[] = {1,1,1,1};
		moving = 1;
		shadow = 0.75;
		x = (0.3 * safezoneW + safezoneX)/SCALE;
		y = (0.3 * safezoneH + safezoneY)/SCALE;
		w = (0.135 * safezoneW)/SCALE;
		h = (0.1 * safezoneH)/SCALE;
		text = "";
		size = DIV_QUOTE((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 3),SCALE);
	};
	class rscDetectorScreen: RscPicture
	{
		idc = 5;
		colorBackground[] = {0,0,0,0.25};
		colorText[] = {1,1,1,0};
		moving = 1;
		text = "\JSHK_contam\data\detectorScreen.paa";
		x = (0.27* safezoneW + safezoneX)/SCALE;
		y = (0.228 * safezoneH + safezoneY)/SCALE;
		w = (0.191 * safezoneW)/SCALE;
		h = (0.2525* safezoneH)/SCALE;
	};
	class rscPowerBtn: RscActiveText
	{
		idc = 6;
		moving = 0;
		x = (0.3375* safezoneW + safezoneX)/SCALE;
		y = (0.605* safezoneH + safezoneY)/SCALE;
		w = (0.055 * safezoneW)/SCALE;
		h = (0.07* safezoneH)/SCALE;
		color[] = {1,1,1,0};
		colorBackground[] = {0,0,0,0};
		colorActive[] = {1,1,1,0};
		colorDisabled[] = {1,1,1,0};
		soundEnter[] = { "", 0, 1 };
		soundPush[] = { "", 0, 1 };
		soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
		soundEscape[] = { "", 0, 1 };
		action = "[] spawn JSHK_contam_fnc_powerDetector;";
		text= "\JSHK_contam\data\detectorScreen.paa";
		tooltip = "";
		default = true;
	};
	class rscSoundBtn: RscActiveText
	{
		idc = 7;
		moving = 0;
		x = ((0.3375/2)* safezoneW + safezoneX)/SCALE;
		y = ((0.605*1.5)* safezoneH + safezoneY)/SCALE;
		w = ((0.055/2) * safezoneW)/SCALE;
		h = ((0.07/2)* safezoneH)/SCALE;
		color[] = {1,1,1,0};
		colorBackground[] = {0,0,0,0};
		colorActive[] = {1,1,1,0};
		colorDisabled[] = {1,1,1,0};
		soundEnter[] = { "", 0, 1 };
		soundPush[] = { "", 0, 1 };
		soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
		soundEscape[] = { "", 0, 1 };
		action = "[] spawn JSHK_contam_fnc_soundDetector;";
		text= "\JSHK_contam\data\soundButton.paa";
		tooltip = "";
		//default = true;
	};
};