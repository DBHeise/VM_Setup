
#Enable the Policy
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'DisableRights' -Value 1 -ea SilentlyContinue 
