$chromeUpdateKey = 'HKLM:\Software\Policies\Google\Update'
$chromeUpdateKeyWOW = 'HKLM:\Software\Wow6432Node\Policies\Google\Update'

$folder86 = "C:\Program Files (x86)\Google\Update\"
$folder64 = "C:\Program Files\Google\Update\"

#Create the key if missing 
ForceRegKey($chromeUpdateKey)
ForceRegKey($chromeUpdateKeyWOW)

#Settings 
Set-ItemProperty -Path $chromeUpdateKey -Name 'UpdateDefault' -Value 0 -Force
Set-ItemProperty -Path $chromeUpdateKey -Name 'AutoUpdateCheckPeriodMinutes' -Value 0 -Force
Set-ItemProperty -Path $chromeUpdateKey -Name 'DisableAutoUpdateChecksCheckboxValue' -Value 1 -Force

#Settings WOW6432
Set-ItemProperty -Path $chromeUpdateKeyWOW -Name 'UpdateDefault' -Value 0 -Force
Set-ItemProperty -Path $chromeUpdateKeyWOW -Name 'AutoUpdateCheckPeriodMinutes' -Value 0 -Force
Set-ItemProperty -Path $chromeUpdateKeyWOW -Name 'DisableAutoUpdateChecksCheckboxValue' -Value 1 -Force

#Dynamically get the GUID needed to disable the update service
if (Test-Path $folder86) {    
    Get-ChildItem -Path ($folder86 + "\Download") | ForEach-Object {
        $guid = $_.Name
        Set-ItemProperty -Path $chromeUpdateKey -Name ('Update' + $guid) -Value 0 -Force
        Set-ItemProperty -Path $chromeUpdateKeyWOW -Name ('Update' + $guid) -Value 0 -Force    
    }
}
if (Test-Path $folder64) {    
    Get-ChildItem -Path ($folder64 + "\Download") | ForEach-Object {
        $guid = $_.Name
        Set-ItemProperty -Path $chromeUpdateKey -Name ('Update' + $guid) -Value 0 -Force
        Set-ItemProperty -Path $chromeUpdateKeyWOW -Name ('Update' + $guid) -Value 0 -Force    
    }
}

#Stop Google Update Services
Stop-Service -Name gupdate -Force
Stop-Service -Name gupdatem -Force

#Disable Google Update Services
Set-Service -Name gupdate -StartupType Disabled
Set-Service -Name gupdatem -StartupType Disabled

#Delete the update folder
if (Test-Path $folder86) { Remove-Item -Path $folder86 -Force | Out-Null }
if (Test-Path $folder64) { Remove-Item -Path $folder64 -Force | Out-Null }

#Remove the Scheduled Tasks
if (Get-Command "Unregister-ScheduledTask" -ErrorAction SilentlyContinue) {
    Unregister-ScheduledTask -TaskName @("GoogleUpdateTaskMachineCore", "GoogleUpdateTaskMachineUA") -Confirm:$false
} else {
    Start-Process -FilePath "C:\windows\System32\schtasks.exe" -ArgumentList @("/DELETE", "/TN", "`"GoogleUpdateTaskMachineCore`"", "/F")
    Start-Process -FilePath "C:\windows\System32\schtasks.exe" -ArgumentList @("/DELETE", "/TN", "`"GoogleUpdateTaskMachineUA`"", "/F")
}

#Remove the Services
(Get-WmiObject Win32_Service -filter "name='gupdate'").Delete()
(Get-WmiObject Win32_Service -filter "name='gupdatem'").Delete()