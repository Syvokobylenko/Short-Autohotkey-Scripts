Hiragana := ["あ","い","う","え","お","か","き","く","け","こ","さ","し","す","せ","そ","た","ち","つ","て","と","な","に","ぬ","ね","の","は","ひ","ふ","へ","ほ","ま","み","む","め","も","や","ゆ","よ","ら","り","る","れ","ろ","わ","を","ん"]
Romaji := ["a","i","u","e","o","ka","ki","ku","ke","ko","sa","shi","su","se","so","ta","chi","tsu","te","to","na","ni","nu","ne","no","ha","hi","fu","he","ho","ma","mi","mu","me","mo","ya","yu","yo","ra","ri","ru","re","ro","wa","wo","n"]
Correct := [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
Appeared := [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
Start:
Random, x, 1, 46
Gui, Destroy
Gui, Add, Text,, % Hiragana[x]
Gui, Add, Edit,  vEntry ym w50, a
Gui, Add, Button, default , Gotowe
Gui, Show,, Hiragana
return
ButtonGotowe:
Appeared[x] += 1
Gui, Submit
Gui, Destroy
if (Romaji[x] = Entry)
	{
	Correct[x] += 1
	Msgbox, Correct
	}
else
	{
	Msgbox % Romaji[x]
	}
goto, Start
GuiClose:
ExitApp