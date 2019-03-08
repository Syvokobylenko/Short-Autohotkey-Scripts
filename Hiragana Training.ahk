Hiragana := ["あ","い","う","え","お","か","き","く","け","こ","さ","し","す","せ","そ","た","ち","つ","て","と","な","に","ぬ","ね","の","は","ひ","ふ","へ","ほ","ま","み","む","め","も","や","ゆ","よ","ら","り","る","れ","ろ","わ","を","ん"]
Romaji := ["a","i","u","e","o","ka","ki","ku","ke","ko","sa","shi","su","se","so","ta","chi","tsu","te","to","na","ni","nu","ne","no","ha","hi","fu","he","ho","ma","mi","mu","me","mo","ya","yu","yo","ra","ri","ru","re","ro","wa","wo","n"]
Correct := [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
Appeared := [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
#Include hiraganasave.ini
Start:
Score := [Correct[1]/(Appeared[1]+1),Correct[2]/(Appeared[2]+1),Correct[3]/(Appeared[3]+1),Correct[4]/(Appeared[4]+1),Correct[5]/(Appeared[5]+1),Correct[6]/(Appeared[6]+1),Correct[7]/(Appeared[7]+1),Correct[8]/(Appeared[8]+1),Correct[9]/(Appeared[9]+1),Correct[10]/(Appeared[10]+1),Correct[11]/(Appeared[11]+1),Correct[12]/(Appeared[12]+1),Correct[13]/(Appeared[13]+1),Correct[14]/(Appeared[14]+1),Correct[15]/(Appeared[15]+1),Correct[16]/(Appeared[16]+1),Correct[17]/(Appeared[17]+1),Correct[18]/(Appeared[18]+1),Correct[19]/(Appeared[19]+1),Correct[20]/(Appeared[20]+1),Correct[21]/(Appeared[21]+1),Correct[22]/(Appeared[22]+1),Correct[23]/(Appeared[23]+1),Correct[24]/(Appeared[24]+1),Correct[25]/(Appeared[25]+1),Correct[26]/(Appeared[26]+1),Correct[27]/(Appeared[27]+1),Correct[28]/(Appeared[28]+1),Correct[29]/(Appeared[29]+1),Correct[30]/(Appeared[30]+1),Correct[31]/(Appeared[31]+1),Correct[32]/(Appeared[32]+1),Correct[33]/(Appeared[33]+1),Correct[34]/(Appeared[34]+1),Correct[35]/(Appeared[35]+1),Correct[36]/(Appeared[36]+1),Correct[37]/(Appeared[37]+1),Correct[38]/(Appeared[38]+1),Correct[39]/(Appeared[39]+1),Correct[40]/(Appeared[40]+1),Correct[41]/(Appeared[41]+1),Correct[42]/(Appeared[42]+1),Correct[43]/(Appeared[43]+1),Correct[44]/(Appeared[44]+1),Correct[45]/(Appeared[45]+1),Correct[46]/(Appeared[46]+1)]
temp = 0
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
FileDelete, hiraganasave.ini
if (ErrorLevel = 1)
	{
	MsgBox,, First time saving data.,  Please make sure there is no "hiraganasave.ini" and click okay.
	}
Appeared_string := "Appeared := [" Appeared[1] "," Appeared[2] "," Appeared[3] "," Appeared[4] "," Appeared[5] "," Appeared[6] "," Appeared[7] "," Appeared[8] "," Appeared[9] "," Appeared[10] "," Appeared[11] "," Appeared[12] "," Appeared[13] "," Appeared[14] "," Appeared[15] "," Appeared[16] "," Appeared[17] "," Appeared[18] "," Appeared[19] "," Appeared[20] "," Appeared[21] "," Appeared[22] "," Appeared[23] "," Appeared[24] "," Appeared[25] "," Appeared[26] "," Appeared[27] "," Appeared[28] "," Appeared[29] "," Appeared[30] "," Appeared[31] "," Appeared[32] "," Appeared[33] "," Appeared[34] "," Appeared[35] "," Appeared[36] "," Appeared[37] "," Appeared[38] "," Appeared[39] "," Appeared[40] "," Appeared[41] "," Appeared[42] "," Appeared[43] "," Appeared[44] "," Appeared[45] "," Appeared[46] "]"
Correct_string := "Correct := [" Correct[1] "," Correct[2] "," Correct[3] "," Correct[4] "," Correct[5] "," Correct[6] "," Correct[7] "," Correct[8] "," Correct[9] "," Correct[10] "," Correct[11] "," Correct[12] "," Correct[13] "," Correct[14] "," Correct[15] "," Correct[16] "," Correct[17] "," Correct[18] "," Correct[19] "," Correct[20] "," Correct[21] "," Correct[22] "," Correct[23] "," Correct[24] "," Correct[25] "," Correct[26] "," Correct[27] "," Correct[28] "," Correct[29] "," Correct[30] "," Correct[31] "," Correct[32] "," Correct[33] "," Correct[34] "," Correct[35] "," Correct[36] "," Correct[37] "," Correct[38] "," Correct[39] "," Correct[40] "," Correct[41] "," Correct[42] "," Correct[43] "," Correct[44] "," Correct[45] "," Correct[46] "]"
FileAppend, %Appeared_string%`n%Correct_string%, hiraganasave.ini
ExitApp