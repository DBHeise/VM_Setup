#Create the key if missing 
$key = "HKLM:\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions"
ForceRegKey($key)
#Enable the Policy
Set-ItemProperty -Path $key -Name 'NoUpdateCheck' -Value 1 -Force


#Create the key if missing 
$key = "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main"
ForceRegKey($key)
#Disable the Policy 
Set-ItemProperty -Path $key -Name 'EnableAutoUpgrade' -Value 0 -ea SilentlyContinue 
