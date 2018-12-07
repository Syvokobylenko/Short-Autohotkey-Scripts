String := ""
Count = 1
Loop
	{
	Key := SubStr(String, Count, 1)
	KeyWait z
	KeyWait z, d
	SetKeyDelay, 0
	Send, %key%
	Count += 1
	}