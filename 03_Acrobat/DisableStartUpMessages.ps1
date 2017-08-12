#Create the key if missing 
If((Test-Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown\cIPM') -eq $false ) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown\cIPM' -force -Force } 

#Disable the Policy 
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown\cIPM' -Name 'bShowMsgAtLaunch' -Value 0 -Force 