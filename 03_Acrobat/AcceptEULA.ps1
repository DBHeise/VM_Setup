#Create the key if missing 
If((Test-Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\AdobeViewer') -eq $false ) { New-Item -Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\AdobeViewer' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\AdobeViewer' -Name 'EULA' -Value 1 -ea SilentlyContinue 
