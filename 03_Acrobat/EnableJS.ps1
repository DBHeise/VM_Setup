#Create the key if missing 
If((Test-Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\JSPrefs') -eq $false ) { New-Item -Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\JSPrefs' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\JSPrefs' -Name 'bEnableJS' -Value 1 -ea SilentlyContinue 
