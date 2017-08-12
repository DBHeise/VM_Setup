#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\TabbedBrowsing') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\TabbedBrowsing' -force -ea SilentlyContinue } 

#Settings 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\TabbedBrowsing' -Name 'NewTabPageShow' -Value 0 -ea SilentlyContinue 