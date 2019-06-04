#define JSHK_CONTAM_MASK_DISPLAY (uiNamespace getVariable ["JSHK_contam_Display", displayNull])
#define JSHK_CONTAM_MASK_OVERLAY 12245
#define JSHK_CONTAM_MASK_OVERLAY_PATH(TYPE) format ["\JSHK_contam\data\maskOverlay%1.paa",TYPE]

#define JSHK_CONTAM_DETECTOR_DISPLAY findDisplay 54701
#define JSHK_CONTAM_DETECTOR_ARROW (JSHK_CONTAM_DETECTOR_DISPLAY displayCtrl (2))
#define JSHK_CONTAM_DETECTOR_TIME_TEXT (JSHK_CONTAM_DETECTOR_DISPLAY displayCtrl (3))
#define JSHK_CONTAM_DETECTOR_CONTAM_TEXT (JSHK_CONTAM_DETECTOR_DISPLAY displayCtrl (4))
#define JSHK_CONTAM_DETECTOR_SCREEN (JSHK_CONTAM_DETECTOR_DISPLAY displayCtrl (5))
#define JSHK_CONTAM_DETECTOR_POWER (JSHK_CONTAM_DETECTOR_DISPLAY displayCtrl (6))
#define JSHK_CONTAM_DETECTOR_SOUNDBTN (JSHK_CONTAM_DETECTOR_DISPLAY displayCtrl (7))
#define JSHK_CONTAM_DETECTOR_SOUNDICON (JSHK_CONTAM_DETECTOR_DISPLAY displayCtrl (8))
#define JSHK_CONTAM_DETECTOR_MAX_CONTAM 999