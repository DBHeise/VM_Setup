
Remove-ItemProperty -Path "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" -Name "SunJavaUpdateSched" -Force
Remove-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" -Name "SunJavaUpdateSched" -Force

$jusched="C:\Program Files\Common Files\Java\Java Update\jusched.exe"

if (Test-Path $jusched) {
	Rename-Item -Path $jusched -NewName ($jusched + ".bak")
}

$jusched="C:\Program Files (86)\Common Files\Java\Java Update\jusched.exe"
if (Test-Path $jusched) {
	Rename-Item -Path $jusched -NewName ($jusched + ".bak")
}



