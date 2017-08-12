#Create the key if missing 
If((Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions') -eq $false ) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions' -force -ea SilentlyContinue } 

#Settings 
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions' -Name 'MitigationOptions_FontBocking' -Value 2000000000000 -ea SilentlyContinue 