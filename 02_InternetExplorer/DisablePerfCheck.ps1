#Create the key if missing 
If((Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Ext') -eq $false ) { New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Ext' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Ext' -Name 'DisableAddonLoadTimePerformanceNotifications' -Value 1 -ea SilentlyContinue 
