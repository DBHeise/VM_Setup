
#Disable NetBios
Stop-Service -Name lmhosts -Force
Set-Service -Name lmhosts -StartupType Disabled
$key = "HKLM:\System\CurrentControlSet\Services\VxD\MSTCP"
ForceRegkey($key)
Set-ItemProperty -Path $key -Name EnableDNS -Type String -Value 0 -Force
