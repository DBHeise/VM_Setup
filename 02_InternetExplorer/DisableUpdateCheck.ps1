#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions' -Name 'NoUpdateCheck' -Value 1 -ea SilentlyContinue 


#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Main') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Main' -force -ea SilentlyContinue } 

#Disable the Policy 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Main' -Name 'EnableAutoUpgrade' -Value 0 -ea SilentlyContinue 
