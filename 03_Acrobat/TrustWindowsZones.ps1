#Create the key if missing 
If((Test-Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\TrustManager') -eq $false ) { New-Item -Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\TrustManager' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\TrustManager' -Name 'bTrustOSTrustedSites' -Value 1 -ea SilentlyContinue 
