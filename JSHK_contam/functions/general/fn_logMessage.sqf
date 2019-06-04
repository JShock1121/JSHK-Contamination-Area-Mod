params [["_in","",[""]],["_override",false,[false]]];
_prefix = "*-*: JSHK_CONTAM LOG MESSAGE: ";
_in = _prefix + _in;
if (!(JSHK_contam_DEBUG) && !(_override)) exitWith {};

diag_log _in;