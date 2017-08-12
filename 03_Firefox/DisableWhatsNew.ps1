#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Mozilla\Firefox') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -Name 'SupressUpdatePage' -Value 1 -ea SilentlyContinue 
