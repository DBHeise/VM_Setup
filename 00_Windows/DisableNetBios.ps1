
#Disable NetBios
Stop-Service -Name lmhosts -Force
Set-Service -Name lmhosts -StartupType Disabled
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\VxD\MSTCP" -Name EnableDNS -Type String -Value 0 -Force
