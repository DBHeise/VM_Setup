
#Disable the Policy 
Set-ItemProperty -Path $AdobeReaderPolicyFLKey -Name 'bUsageMeasurement' -Value 0 -Force