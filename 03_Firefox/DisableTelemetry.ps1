
#Enable the Policy
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'DisableTelemetry' -Value 1 -ea SilentlyContinue 
