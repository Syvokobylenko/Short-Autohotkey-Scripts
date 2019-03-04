FormatTime, DateString ,, dd.MM.yy
FormatTime, HourString ,, HH
FormatTime, MinString ,, mm
if !FileExist( A_AppData "\RenPy\Monika After Story\persistent - " DateString "r*")
	{
	FileCopy, %A_AppData%\RenPy\Monika After Story\persistent, %A_AppData%\RenPy\Monika After Story\persistent - %DateString%r - %HourString%h%MinString%m
	}