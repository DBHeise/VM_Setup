
#Settings 
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'DisableUpdate' -Value 1 -ea SilentlyContinue 
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'DisableExtensionsUpdate' -Value 1 -ea SilentlyContinue 
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'DisableSearchUpdate' -Value 1 -ea SilentlyContinue 
