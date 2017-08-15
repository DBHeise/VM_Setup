#Create the key if missing 
$key = "HKLM:\Software\Policies\Microsoft\Internet Explorer\Security"
ForceRegKey($key)
#Enable the Policy
Set-ItemProperty -Path $key -Name 'DisableSecuritySettingsCheck' -Value 1 -Force