SetKeyDelay, -1
Loop
	{
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, mas/play.bmp
	if ErrorLevel = 0
		{
		MouseClick, left, %FoundX%, %FoundY%
		break
		}
	}
Loop
	{
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, mas/piano.bmp
	if ErrorLevel = 0
		{
		MouseClick, left, %FoundX%, %FoundY%
		break
		}
	MouseClick, left, 40, 40
	}
Loop
	{
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, mas/song.bmp
	if ErrorLevel = 0
		{
		MouseClick, left, %FoundX%, %FoundY%
		break
		}
	MouseClick, left, 40, 40
	}
Loop
	{
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, mas/reality.bmp
	if ErrorLevel = 0
		{
		MouseClick, left, %FoundX%, %FoundY%
		break
		}
	MouseClick, left, 40, 40
	}
Loop
	{
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, mas/config.bmp
	if ErrorLevel = 0
		{
		break
		}
	MouseClick, left, 40, 40
	}
Send, OOOOIUUIOUYTYUTWOPOOPO]]P[OP[OOPOUIOIUYEWQEWUTOPOOPO]]P[OP[OOOOIUTTYUOPOUYWETETYTOOOIUTTYUOPOUYWETETYTPOUYWETETYTOOOOIUUIOUYTYUTWOPOOPO]]P[OP[OOPOUIOIUYEWQEWUTOPOOPO]]P[OP[OOOOIUTTYUOPOUYWETETYTOOOIUTTYUOPOUYWETETYTOOOOIUUIOUYTYUTWOPOUIOIUYEWQEWUTOOOIUTTYUOPOUYWETETYTOOOIUTTYUOPOUYWETETYTWETETYTUIIUTETOOUITPOWETT
return