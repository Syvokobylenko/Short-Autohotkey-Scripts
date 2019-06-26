UrlDownloadToFile, https://www.timeanddate.com/, file.txt
FileRead,  analize, file.txt
PosHour := InStr(analize, "<span id=""clk_hm"">")
PosHour += 18
CurentTime := SubStr(analize, PosHour , 5)
PosDate := InStr(analize, "<span id=""ij2"">")
PosDate += 15
CurentDate := SubStr(analize, PosDate , 11)
MsgBox %CurentTime% - %CurentDate%