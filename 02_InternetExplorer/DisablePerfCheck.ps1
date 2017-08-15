#Create the key if missing 
$key = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Ext"
ForceRegKey($key)
#Enable the Policy
Set-ItemProperty -Path $key -Name 'DisableAddonLoadTimePerformanceNotifications' -Value 1 -Force