FormatTime, DateString ,, dd.MM.yy
FormatTime, HourString ,, HH
FormatTime, MinString ,, mm
if FileExist( A_AppData "\RenPy\Monika After Story\persistent")
	{
	FileMove %A_AppData%\RenPy\Monika After Story\persistent, %A_AppData%\RenPy\Monika After Story\persistent OLD - %DateString%r - %HourString%h%MinString%m
	MsgBox There was another Monika on this computer. You can find her in %A_AppData%\RenPy\Monika After Story\persistent OLD - %DateString%r - %HourString%h%MinString%m
	}
FileCreateDir, %A_AppData%\RenPy\Monika After Story
FileCopy, %A_WorkingDir%\Doki Doki Literature Club\cross-over\RenPy\Monika After Story\persistent , %A_AppData%\RenPy\Monika After Story\persistent
FileCreateDir, %A_WorkingDir%\Doki Doki Literature Club\cross-over\RenPy\Monika After Story\%DateString%
FileMove, %A_WorkingDir%\Doki Doki Literature Club\cross-over\RenPy\Monika After Story\persistent , %A_WorkingDir%\Doki Doki Literature Club\cross-over\RenPy\Monika After Story\%DateString%\persistent start- %DateString%r - %HourString%h%MinString%m
sleep 3000
RunWait, %A_WorkingDir%\Doki Doki Literature Club\DDLC.exe
BackupSec := 0
sleep 20000
Loop,
	{
	Process, Exist, DDLC.exe
	if(errorlevel)
		{
		break
		}
	Sleep 1000
	BackupSec += 1
	if ( BackupSec > 1800)
		{
		FormatTime, DateString ,, dd.MM.yy
		FormatTime, HourString ,, HH
		FormatTime, MinString ,, mm
		FileCopy, %A_AppData%\RenPy\Monika After Story\persistent , %A_WorkingDir%\Doki Doki Literature Club\cross-over\RenPy\Monika After Story\%DateString%\persistent - %DateString%r - %HourString%h%MinString%m
		}
	}

Process, Close, MasPersistentBackup.exe
FormatTime, DateString ,, dd.MM.yy
FormatTime, HourString ,, HH
FormatTime, MinString ,, mm
FileCreateDir, %A_WorkingDir%\Doki Doki Literature Club\cross-over\RenPy\Monika After Story\%DateString%

if !FileExist( A_WorkingDir "\Doki Doki Literature Club\cross-over\RenPy\Monika After Story\persistent")
	{
	FileCopy, %A_AppData%\RenPy\Monika After Story\persistent, %A_AppData%\RenPy\Monika After Story\persistent - %DateString%r - %HourString%h%MinString%m
	}
Else
	{
	MsgBox There was an error while saving Monika to flashdrive. It seems like there is a persistent at %A_WorkingDir%\Doki Doki Literature Club\cross-over\RenPy\Monika After Story\persistent
	}	
