#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Safety\ActiveXFiltering') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Safety\ActiveXFiltering' -force -ea SilentlyContinue } 

#Disable the Policy 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Safety\ActiveXFiltering' -Name 'IsEnabled' -Value 0 -ea SilentlyContinue 
