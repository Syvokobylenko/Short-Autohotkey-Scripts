Input, TemplateVar, L1
Hiragana := ["き","さ","そ","ち","つ","ぬ","ね","は","む","め","も","ら","り","る","れ","わ"]
Romaji := ["ki","sa","so","chi","tsu","nu","ne","ha","mu","me","mo","ra","ri","ru","re","wa"]
Start:
Random, x, 1, 16
Gui, Destroy
Gui, Add, Text,, % Hiragana[x]
Gui, Add, Edit,  vEntry ym w50, a
Gui, Add, Button, default , Gotowe
Gui, Show,, Hiragana
return
ButtonGotowe:
Gui, Submit
Gui, Destroy
if (Romaji[x] = Entry)
	{
	Msgbox, Correct
	}
else
	{
	Msgbox % Romaji[x]
	
	}
goto, Start