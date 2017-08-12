#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Windows NT\SystemRestore') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\SystemRestore' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\SystemRestore' -Name 'DisableSR' -Value 1 -ea SilentlyContinue 