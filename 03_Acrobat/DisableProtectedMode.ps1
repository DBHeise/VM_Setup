#Create the key if missing 
If((Test-Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown') -eq $false ) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown' -force -Force } 

#Disable the Policy 
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown' -Name 'bProtectedMode' -Value 0 -Force 
