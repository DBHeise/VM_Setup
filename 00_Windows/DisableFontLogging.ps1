$key = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions'
ForceRegKey($key)
Set-ItemProperty -Path $key -Name 'MitigationOptions_FontBocking' -Value 2000000000000 -ea SilentlyContinue 