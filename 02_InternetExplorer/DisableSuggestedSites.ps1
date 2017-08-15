#Create the key if missing 
$key = "HKLM:\Software\Policies\Microsoft\Internet Explorer\Suggested Sites"
ForceRegKey($key)

#Disable the Policy 
Set-ItemProperty -Path $key -Name 'Enabled' -Value 0 -Force