
#Enable the Policy
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'DisableDefaultCheck' -Value 1 -ea SilentlyContinue 
