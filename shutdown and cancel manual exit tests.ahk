#Persistent


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
        run, %comspec% /c shutdown -a,,hide
        MsgBox Don't shut down the PC on me!
        return 1
        }
}

class MyObject
{
    Exiting()
    {
    MsgBox Shutting Down
    }
}

Gui, Add, Text,, Testing prevent shut down
Gui, Add, Button, gclose , close the game
Gui, Show,, exit tests
return
close:
ExitApp

MsgBox this shouldnt be visible