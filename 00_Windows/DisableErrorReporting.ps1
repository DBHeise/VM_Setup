
# Disable Windows Error Reporting
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\Windows Error Reporting" -Name Disabled -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\AeDebug" -Name Auto -Type String -Value 1 -Force
