params [["_in","",[""]],["_removeWhitespace",true,[false]]];
private _str = _in splitString ",";
if (_removeWhitespace) then
{
	private _temp = [];
	{
		_temp pushBack ((_x splitString " ") joinString "");
	} forEach _str;
	_temp;
} else
{
	_str;
};