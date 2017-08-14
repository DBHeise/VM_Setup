$key = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit'
#Create the key if missing 
ForceRegKey $key

#Enable the Policy
Set-ItemProperty -Path $key -Name 'ProcessCreationIncludeCmdLine_Enabled' -Value 1 -ea SilentlyContinue 