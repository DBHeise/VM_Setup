#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Suggested Sites') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Suggested Sites' -force -ea SilentlyContinue } 

#Disable the Policy 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Suggested Sites' -Name 'Enabled' -Value 0 -ea SilentlyContinue 