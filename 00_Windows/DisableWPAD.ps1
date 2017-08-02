#Disable WPAD
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Wpad" -Name WpadOverride -Type DWORD -Value 0x1 -Force
