Set WinHostShell = CreateObject("WScript.Shell")
WinHostShell.Run Chr(34) & "C:\Users\Mike\.scripts\backup.bat" & Chr(34), 0
Set WinHostShell = Nothing
