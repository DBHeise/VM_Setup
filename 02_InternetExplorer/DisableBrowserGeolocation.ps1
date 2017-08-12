#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Geolocation') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Geolocation' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Geolocation' -Name 'PolicyDisableGeolocation' -Value 1 -ea SilentlyContinue 