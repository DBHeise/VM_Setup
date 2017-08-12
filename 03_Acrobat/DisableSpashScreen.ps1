#Create the key if missing 
If((Test-Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\Originals') -eq $false ) { New-Item -Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\Originals' -force -ea SilentlyContinue } 

#Disable the Policy 
Set-ItemProperty -Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\Originals' -Name 'bDisplayAboutDialog' -Value 0 -ea SilentlyContinue 
