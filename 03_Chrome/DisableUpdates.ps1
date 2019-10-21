$chromeUpdateKey = 'HKLM:\Software\Policies\Google\Update'
$chromeUpdateKeyWOW = 'HKLM:\Software\Wow6432Node\Policies\Google\Update'

#Create the key if missing 
ForceRegKey($chromeUpdateKey)
ForceRegKey($chromeUpdateKeyWOW)

#Settings 
Set-ItemProperty -Path $chromeUpdateKey -Name 'UpdateDefault' -Value 0 -Force
Set-ItemProperty -Path $chromeUpdateKey -Name 'AutoUpdateCheckPeriodMinutes' -Value 0 -Force
Set-ItemProperty -Path $chromeUpdateKey -Name 'DisableAutoUpdateChecksCheckboxValue' -Value 1 -Force
Set-ItemProperty -Path $chromeUpdateKey -Name 'Update{8A69D345-D564-463C-AFF1-A69D9E530F96}' -Value 0 -Force

#Settings WOW6432
Set-ItemProperty -Path $chromeUpdateKeyWOW -Name 'UpdateDefault' -Value 0 -Force
Set-ItemProperty -Path $chromeUpdateKeyWOW -Name 'AutoUpdateCheckPeriodMinutes' -Value 0 -Force
Set-ItemProperty -Path $chromeUpdateKeyWOW -Name 'DisableAutoUpdateChecksCheckboxValue' -Value 1 -Force
Set-ItemProperty -Path $chromeUpdateKeyWOW -Name 'Update{8A69D345-D564-463C-AFF1-A69D9E530F96}' -Value 0 -Force

#Stop Google Update Services
Stop-Service -Name gupdate -Force
Stop-Service -Name gupdatem -Force

#Disable Google Update Services
Set-Service -Name gupdate -StartupType Disabled
Set-Service -Name gupdatem -StartupType Disabled

#Delete the update folder
$folder = "C:\Program Files (x86)\Google\Update\"
if (Test-Path $folder) { Remove-Item -Path $folder -Force | Out-Null }
$folder = "C:\Program Files\Google\Update\"
if (Test-Path $folder) { Remove-Item -Path $folder -Force | Out-Null }

