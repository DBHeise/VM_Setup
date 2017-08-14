#Disable Automatic Proxy Result Cache
$key = "HKCU:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings"
ForceRegKey($key)
Set-ItemProperty -Path  $key -Name EnableAutoproxyResultCache -Type DWORD -Value 0x0 -Force
