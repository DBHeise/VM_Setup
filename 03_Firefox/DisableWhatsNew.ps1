
#Enable the Policy
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'SupressUpdatePage' -Value 1 -ea SilentlyContinue 
