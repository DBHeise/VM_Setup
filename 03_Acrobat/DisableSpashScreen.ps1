
#Disable the Policy 
Set-ItemProperty -Path $AdobeReaderPolicyFLKey -Name 'bDisplayAboutDialog' -Value 0 -ea SilentlyContinue 
