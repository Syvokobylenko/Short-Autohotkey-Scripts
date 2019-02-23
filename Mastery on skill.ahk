SetKeyDelay, 0
Loop
	{
	KeyWait, LControl
	if GetKeyState("Q") or GetKeyState("W") or GetKeyState("E")
		{
		Random, x, 1, 5
		if (x = 1)
			{
			send, p
			}
		if (x = 2)
			{
			send, o
			}
		if (x = 3)
			{
			send, l
			}
		if (x = 4)
			{
			send, k
			}
		if (x = 5)
			{
			send, j
			}
		send {BackSpace}
		sleep 1000
		}
	if GetKeyState("R")
		{
		send, i
		send {BackSpace}
		sleep 1000
		}
	if GetKeyState("D")
		{
		send, i
		send {BackSpace}
		sleep 1000
		}
	if GetKeyState("F")
		{
		send, i
		send {BackSpace}
		sleep 1000
		}
	}