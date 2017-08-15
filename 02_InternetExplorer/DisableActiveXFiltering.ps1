#Create the key if missing 
$key = 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Safety\ActiveXFiltering'
ForceRegkey($key)
#Disable the Policy 
Set-ItemProperty -Path $key -Name 'IsEnabled' -Value 0 -Force
