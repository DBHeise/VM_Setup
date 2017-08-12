#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Restrictions') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Restrictions' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Restrictions' -Name 'NoPopupManagement' -Value 1 -ea SilentlyContinue 
