class JSHK_contam_rscPicture: RscPicture
{
	access=0;
	idc=-1;
	type=0;
	style=48;
	colorBackground[]={0,0,0,0};
	colorText[]={1,1,1,1};
	font="puristaMedium";
	sizeEx=0;
	lineSpacing=0;
	fixedWidth=0;
	shadow=0;
	text="";
	x="safezoneX";
	y="safezoneY";
	w="safezoneW";
	h="safezoneH";
};
class Rsc_JSHK_contam_BaseTitle
{
	idd=-1;
	onLoad="uiNamespace setVariable ['JSHK_contam_Display', _this select 0]";
	onUnload="uiNamespace setVariable ['JSHK_contam_Display', displayNull]";
	fadeIn=0.5;
	fadeOut=0.5;
	movingEnable="false";
	duration=9.9999998e+010;
	name="Rsc_JSHK_contam_BaseTitle";
	class controls;
};
class Rsc_JSHK_contam_overlay: Rsc_JSHK_contam_BaseTitle
{
	idd=1121;
	name="Rsc_JSHK_contam_overlay";
	class controls
	{
		class maskOverlay: JSHK_contam_rscPicture
		{
			idc=12245;
		};
	};
};