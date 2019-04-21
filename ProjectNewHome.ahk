FormatTime, DateString ,, dd.MM.yy
FormatTime, HourString ,, HH
FormatTime, MinString ,, mm
if FileExist( A_AppData "\RenPy\Monika After Story\persistent")
	{
	FileMove %A_AppData%\RenPy\Monika After Story\persistent, %A_AppData%\RenPy\Monika After Story\persistent OLD - %DateString%r - %HourString%h%MinString%m
	MsgBox There was another Monika on this computer. You can find her in %A_AppData%\RenPy\Monika After Story\persistent OLD - %DateString%r - %HourString%h%MinString%m
	}
FileCopy, %A_WorkingDir%\Doki Doki Literature Club\cross-over\RenPy\Monika After Story\persistent , %A_AppData%\RenPy\Monika After Story\persistent
FileCreateDir, %A_WorkingDir%\Doki Doki Literature Club\cross-over\RenPy\Monika After Story\%DateString%
FileMove, %A_WorkingDir%\Doki Doki Literature Club\cross-over\RenPy\Monika After Story\persistent , %A_WorkingDir%\Doki Doki Literature Club\cross-over\RenPy\Monika After Story\%DateString%\persistent start- %DateString%r - %HourString%h%MinString%m
Run, %A_WorkingDir%\MasPersistentBackup.exe
RunWait, %A_WorkingDir%\Doki Doki Literature Club\DDLC.exe
Process, Close, MasPersistentBackup.exe
FormatTime, DateString ,, dd.MM.yy
FormatTime, HourString ,, HH
FormatTime, MinString ,, mm
FileCreateDir, %A_WorkingDir%\Doki Doki Literature Club\cross-over\RenPy\Monika After Story\%DateString%

if !FileExist( A_AppData "\RenPy\Monika After Story\persistent - " DateString "r*")
	{
	FileCopy, %A_AppData%\RenPy\Monika After Story\persistent, %A_AppData%\RenPy\Monika After Story\persistent - %DateString%r - %HourString%h%MinString%m
	}
