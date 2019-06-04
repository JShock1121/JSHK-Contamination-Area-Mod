#define SCALE 1.25
#define DIV(x,y) x/y
#define QUOTE(n) #n
#define QQUOTE(n) QUOTE(QUOTE(n))
#define DIV_QUOTE(x,y) QUOTE(DIV(x,y))
#define DISPLAY_SCRIPT_PATH \JSHK_contam\modules\zeus\ui\displays
#define LOAD(STUFF,STUFF2) QUOTE([QQUOTE(STUFF2),_this,QQUOTE(STUFF),'JSHK_contam_displays'] call (uinamespace getvariable 'BIS_fnc_initDisplay'))
#define CONTROL(NUMBER,CLASS) class control##NUMBER##: RscDisplayAttributeContam##CLASS##{}