#Create the key if missing 
$key = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Ext"
ForceRegkey($key)
#Enable the Policy
Set-ItemProperty -Path $key -Name 'NoFirsttimeprompt' -Value 1 -ea SilentlyContinue 
