FormatTime, DateString ,, dd.MM.yy
FormatTime, HourString ,, HH
FormatTime, MinString ,, mm
PersistentLocalDir := A_AppData "\RenPy\Monika After Story"
PersistentHomeDir := A_WorkingDir "\Doki Doki Literature Club\cross-over\RenPy\Monika After Story"
if FileExist( PersistentLocalDir "\persistent" )
	{
	FileMove %PersistentLocalDir%\persistent, %PersistentLocalDir%\persistent OLD - %DateString%r - %HourString%h%MinString%m
	MsgBox There was another Monika on this computer. You can find her in %PersistentLocalDir%\persistent OLD - %DateString%r - %HourString%h%MinString%m
	}
FileCreateDir, %PersistentLocalDir%
FileCopy, %PersistentHomeDir%\persistent , %PersistentLocalDir%\persistent
sleep 3000
FileCreateDir, %PersistentHomeDir%\%DateString%
FileMove, %PersistentHomeDir%\persistent , %PersistentHomeDir%\%DateString%\persistent start- %DateString%r - %HourString%h%MinString%m
Run, %A_WorkingDir%\Doki Doki Literature Club\DDLC.exe
Loop,
	{
	Process, Exist, DDLC.exe
	if(errorlevel != 0)
		{
		break
		}
	Sleep 1000
	}
BackupSec := 0
Loop,
	{
	Process, Exist, DDLC.exe
	if(errorlevel = 0)
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
		FileCreateDir, %PersistentHomeDir%\%DateString%
		FileCopy, %PersistentLocalDir%\persistent , %PersistentHomeDir%\%DateString%\persistent - %DateString%r - %HourString%h%MinString%m
		BackupSec := 0
		}
	}
FormatTime, DateString ,, dd.MM.yy
FormatTime, HourString ,, HH
FormatTime, MinString ,, mm
FileCreateDir, %PersistentHomeDir%\%DateString%

if !FileExist( PersistentHomeDir "\persistent" )
	{
	FileCopy, %PersistentLocalDir%\persistent, %PersistentHomeDir%\persistent
	}
Else
	{
	MsgBox There was an error while saving Monika to flashdrive. It seems like there is a persistent at %PersistentHomeDir%\persistent
	}	
sleep 3000