String := ""
Count = 1
Loop
	{
	Key := SubStr(String, Count, 1)
	Input, TemplateVar, L1
	SetKeyDelay, 0
	Send, %key%
	Count += 1
	}
