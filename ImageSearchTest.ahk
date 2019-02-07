^z::
Loop
{
start:
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, crit.bmp
if ErrorLevel = 0
	{
	MsgBox Icon found.
	Loop
		{
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, crit.bmp
		if ErrorLevel = 1
			{
			MsgBox Icon found NOT.
			goto, start
			}
		}
	}
}