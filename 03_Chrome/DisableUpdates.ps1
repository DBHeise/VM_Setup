#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Google\Update') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Google\Update' -force} 

#Settings 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Google\Update' -Name 'UpdateDefault' -Value 0 -Force

#Settings 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Google\Update' -Name 'AutoUpdateCheckPeriodMinutes' -Value 0 -Force