
#Enable the Policy
Set-ItemProperty -Path $AdobeReaderBaseKey -Name 'EULA' -Value 1 -ea SilentlyContinue 
