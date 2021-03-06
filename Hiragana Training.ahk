#SingleInstance, force
Hiragana := ["あ","い","う","え","お","か","き","く","け","こ","さ","し","す","せ","そ","た","ち","つ","て","と","な","に","ぬ","ね","の","は","ひ","ふ","へ","ほ","ま","み","む","め","も","や","ゆ","よ","ら","り","る","れ","ろ","わ","を","ん"]
Romaji := ["a","i","u","e","o","ka","ki","ku","ke","ko","sa","shi","su","se","so","ta","chi","tsu","te","to","na","ni","nu","ne","no","ha","hi","fu","he","ho","ma","mi","mu","me","mo","ya","yu","yo","ra","ri","ru","re","ro","wa","wo","n"]
A := [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
C := [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
L := [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
#Include configandsave.ini 
Start:
for i, cur_point in L
    {
	L[i] += 1
    }
Score := [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
for i, cur_point in L
    {
	Random, rand, 0, 5
	Score[i] := ((C[i]/A[i]) * 20 + rand ) - cur_point
    }
temp := 1000
x := 0
for i, cur_score in Score
    {
    if ( temp > cur_score )
        {
        x := i
        temp := cur_score
        }
    }
Gui, Destroy
Gui, Add, Text,, % Hiragana[x]
Gui, Add, Edit,  vEntry ym w50, answer
Gui, Add, Button, ym default gCheck, Check
Gui, Add, Button, gStats , Show Stats
Gui, Show,, Hiragana
return
Check:
A[x] += 1
L[x] := 0
Gui, Submit
Gui, Destroy
if (Romaji[x] = Entry)
	{
	C[x] += 1
	Msgbox, Correct
	}
else
	{
	Msgbox % Romaji[x]
	}
goto, Start
stats:
GuiClose:
FileDelete, configandsave.ini
if (ErrorLevel = 1)
	{
	MsgBox,, Error while removing data., Please make sure there is no "configandsave.ini" in the directory and click okay.
	}
A_string := "A := [" A[1] "," A[2] "," A[3] "," A[4] "," A[5] "," A[6] "," A[7] "," A[8] "," A[9] "," A[10] "," A[11] "," A[12] "," A[13] "," A[14] "," A[15] "," A[16] "," A[17] "," A[18] "," A[19] "," A[20] "," A[21] "," A[22] "," A[23] "," A[24] "," A[25] "," A[26] "," A[27] "," A[28] "," A[29] "," A[30] "," A[31] "," A[32] "," A[33] "," A[34] "," A[35] "," A[36] "," A[37] "," A[38] "," A[39] "," A[40] "," A[41] "," A[42] "," A[43] "," A[44] "," A[45] "," A[46] "]"
C_string := "C := [" C[1] "," C[2] "," C[3] "," C[4] "," C[5] "," C[6] "," C[7] "," C[8] "," C[9] "," C[10] "," C[11] "," C[12] "," C[13] "," C[14] "," C[15] "," C[16] "," C[17] "," C[18] "," C[19] "," C[20] "," C[21] "," C[22] "," C[23] "," C[24] "," C[25] "," C[26] "," C[27] "," C[28] "," C[29] "," C[30] "," C[31] "," C[32] "," C[33] "," C[34] "," C[35] "," C[36] "," C[37] "," C[38] "," C[39] "," C[40] "," C[41] "," C[42] "," C[43] "," C[44] "," C[45] "," C[46] "]"
L_string := "L := [" L[1] "," L[2] "," L[3] "," L[4] "," L[5] "," L[6] "," L[7] "," L[8] "," L[9] "," L[10] "," L[11] "," L[12] "," L[13] "," L[14] "," L[15] "," L[16] "," L[17] "," L[18] "," L[19] "," L[20] "," L[21] "," L[22] "," L[23] "," L[24] "," L[25] "," L[26] "," L[27] "," L[28] "," L[29] "," L[30] "," L[31] "," L[32] "," L[33] "," L[34] "," L[35] "," L[36] "," L[37] "," L[38] "," L[39] "," L[40] "," L[41] "," L[42] "," L[43] "," L[44] "," L[45] "," L[46] "]"
FileAppend, %A_string%`n%C_string%`n%L_string%, configandsave.ini
ExitApp