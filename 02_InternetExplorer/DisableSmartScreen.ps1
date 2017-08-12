#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\PhishingFilter') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\PhishingFilter' -force -ea SilentlyContinue } 

#Settings 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\PhishingFilter' -Name 'EnabledV8' -Value 0 -ea SilentlyContinue 