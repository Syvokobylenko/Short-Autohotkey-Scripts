SetKeyDelay, 0
Loop
	{
	KeyWait, LControl
	if GetKeyState("Q") or GetKeyState("W") or GetKeyState("E") or GetKeyState("R")
		{
		send, p
		Send {BackSpace}
		sleep 5000
		}
	}