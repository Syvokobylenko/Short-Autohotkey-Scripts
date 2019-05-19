#Persistent
#SingleInstance, ignore
DllCall("kernel32.dll\SetProcessShutdownParameters", UInt, 0x4FF, UInt, 0)
OnExit("ExitFunc")
OnExit(ObjBindMethod(MyObject, "Exiting"))

ExitFunc(ExitReason, ExitCode)
	{
    if ExitReason not in Logoff,Shutdown,Exit
        {
        MsgBox Close the DDLC first you dummy!
        return 1
        }
    if ExitReason in Logoff,Shutdown
        {
        run, %comspec% /c shutdown /a,,hide
        MsgBox Don't shut down the PC on me!
        return 1
        }
	}

class MyObject
	{
    Exiting()
		{
		FormatTime, DateString ,, dd.MM.yy
		FormatTime, HourString ,, HH
		FormatTime, MinString ,, mm
		FileCreateDir, %PersistentHomeDir%\%DateString%
		copebeforeclose:
		if !FileExist( PersistentHomeDir "\persistent" )
			{
			FileCopy, %PersistentLocalDir%\persistent, %PersistentHomeDir%\persistent
			}
		sleep 2000
		if FileExist( PersistentHomeDir "\persistent" )
			{
			FileDelete, PersistentLocalDir "\persistent"
			}
		Else
			{
			Goto, copebeforeclose
			}
		}
	}
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
FileMove, %PersistentHomeDir%\persistent , %PersistentHomeDir%\%DateString%\persistent - %DateString%r - %HourString%h%MinString%m - start
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
ExitApp