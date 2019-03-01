
#Disable the Policy 
Set-ItemProperty -Path $AdobeReaderPolicyFLKey -Name 'bProtectedMode' -Value 0 -Force 
