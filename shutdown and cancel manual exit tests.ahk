OnExit("ExitFunc")
OnExit(ObjBindMethod(MyObject, "Exiting"))

ExitFunc(ExitReason, ExitCode)
{
    if ExitReason not in Logoff,Shutdown
        {
        MsgBox Close the DDLC first you dummy!
        return 1
        }
    if ExitReason in Logoff,Shutdown
        {
        run, %comspec% /c shutdown -a,,hide
        MsgBox Don't shut down the PC on me!
        }
}

class MyObject
{
    Exiting()
    {
    
    }
}