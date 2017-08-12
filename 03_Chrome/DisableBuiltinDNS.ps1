#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Google\Chrome') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Google\Chrome' -force -Force } 

#Disable the Policy 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Google\Chrome' -Name 'BuiltInDnsClientEnabled' -Value 0 -Force 