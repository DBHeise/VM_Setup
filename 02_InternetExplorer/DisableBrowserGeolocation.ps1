#Create the key if missing 
$key = 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Geolocation'
ForceRegKey($key)
#Enable the Policy
Set-ItemProperty -Path $key -Name 'PolicyDisableGeolocation' -Value 1 -Force