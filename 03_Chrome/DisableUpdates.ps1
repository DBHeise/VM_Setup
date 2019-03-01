$chromeUpdateKey = 'HKLM:\Software\Policies\Google\Update'

#Create the key if missing 
ForceRegKey($chromeUpdateKey)

#Settings 
Set-ItemProperty -Path $chromeUpdateKey -Name 'UpdateDefault' -Value 0 -Force

#Settings 
Set-ItemProperty -Path $chromeUpdateKey -Name 'AutoUpdateCheckPeriodMinutes' -Value 0 -Force