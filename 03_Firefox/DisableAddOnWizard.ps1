
#Enable the Policy
Set-ItemProperty -Path $FireFoxBasePolicyRegKey-Name 'DisableAddonWizard' -Value 1 -ea SilentlyContinue 