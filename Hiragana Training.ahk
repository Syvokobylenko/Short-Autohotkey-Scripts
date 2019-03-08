Hiragana := ["あ","い","う","え","お","か","き","く","け","こ","さ","し","す","せ","そ","た","ち","つ","て","と","な","に","ぬ","ね","の","は","ひ","ふ","へ","ほ","ま","み","む","め","も","や","ゆ","よ","ら","り","る","れ","ろ","わ","を","ん"]
Romaji := ["a","i","u","e","o","ka","ki","ku","ke","ko","sa","shi","su","se","so","ta","chi","tsu","te","to","na","ni","nu","ne","no","ha","hi","fu","he","ho","ma","mi","mu","me","mo","ya","yu","yo","ra","ri","ru","re","ro","wa","wo","n"]
A := [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
C := [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
#Include configandsave.ini
Start:
Score := [C[1]/A[1],C[2]/A[2],C[3]/A[3],C[4]/A[4],C[5]/A[5],C[6]/A[6],C[7]/A[7],C[8]/A[8],C[9]/A[9],C[10]/A[10],C[11]/A[11],C[12]/A[12],C[13]/A[13],C[14]/A[14],C[15]/A[15],C[16]/A[16],C[17]/A[17],C[18]/A[18],C[19]/A[19],C[20]/A[20],C[21]/A[21],C[22]/A[22],C[23]/A[23],C[24]/A[24],C[25]/A[25],C[26]/A[26],C[27]/A[27],C[28]/A[28],C[29]/A[29],C[30]/A[30],C[31]/A[31],C[32]/A[32],C[33]/A[33],C[34]/A[34],C[35]/A[35],C[36]/A[36],C[37]/A[37],C[38]/A[38],C[39]/A[39],C[40]/A[40],C[41]/A[41],C[42]/A[42],C[43]/A[43],C[44]/A[44],C[45]/A[45],C[46]/A[46]]
last_score := 1
x = 1
for i, cur_score in Score
    {
	evaluate := ((2 * (1 - last_score)) - ( 1 - cur_score )) * 100
	Random, rand, 0, 100
    if ( evaluate > rand )
        {
        x := i
		last_score := cur_score
        }
    }
Gui, Destroy
Gui, Add, Text,, % Hiragana[x]
Gui, Add, Edit,  vEntry ym w50, a
Gui, Add, Button, default , Gotowe
Gui, Show,, Hiragana
return
ButtonGotowe:
A[x] += 1
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
GuiClose:
FileDelete, configandsave.ini
if (ErrorLevel = 1)
	{
	MsgBox,, First time saving data.,  Please make sure there is no "configandsave.ini" and click okay.
	}
A_string := "A := [" A[1] "," A[2] "," A[3] "," A[4] "," A[5] "," A[6] "," A[7] "," A[8] "," A[9] "," A[10] "," A[11] "," A[12] "," A[13] "," A[14] "," A[15] "," A[16] "," A[17] "," A[18] "," A[19] "," A[20] "," A[21] "," A[22] "," A[23] "," A[24] "," A[25] "," A[26] "," A[27] "," A[28] "," A[29] "," A[30] "," A[31] "," A[32] "," A[33] "," A[34] "," A[35] "," A[36] "," A[37] "," A[38] "," A[39] "," A[40] "," A[41] "," A[42] "," A[43] "," A[44] "," A[45] "," A[46] "]"
C_string := "C := [" C[1] "," C[2] "," C[3] "," C[4] "," C[5] "," C[6] "," C[7] "," C[8] "," C[9] "," C[10] "," C[11] "," C[12] "," C[13] "," C[14] "," C[15] "," C[16] "," C[17] "," C[18] "," C[19] "," C[20] "," C[21] "," C[22] "," C[23] "," C[24] "," C[25] "," C[26] "," C[27] "," C[28] "," C[29] "," C[30] "," C[31] "," C[32] "," C[33] "," C[34] "," C[35] "," C[36] "," C[37] "," C[38] "," C[39] "," C[40] "," C[41] "," C[42] "," C[43] "," C[44] "," C[45] "," C[46] "]"
FileAppend, %A_string%`n%C_string%, configandsave.ini
ExitApp