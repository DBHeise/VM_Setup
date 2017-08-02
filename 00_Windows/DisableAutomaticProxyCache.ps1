#Disable Automatic Proxy Result Cache
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Name EnableAutoproxyResultCache -Type DWORD -Value 0x0 -Force
