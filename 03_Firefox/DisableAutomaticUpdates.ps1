#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Mozilla\Firefox') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -force -ea SilentlyContinue } 

#Settings 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -Name 'DisableUpdate' -Value 1 -ea SilentlyContinue 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -Name 'DisableExtensionsUpdate' -Value 1 -ea SilentlyContinue 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -Name 'DisableSearchUpdate' -Value 1 -ea SilentlyContinue 
