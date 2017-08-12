#Create the key if missing 
If((Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit') -eq $false ) { New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit' -Name 'ProcessCreationIncludeCmdLine_Enabled' -Value 1 -ea SilentlyContinue 