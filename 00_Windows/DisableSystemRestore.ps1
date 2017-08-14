$key = "HKLM:\Software\Policies\Microsoft\Windows NT\SystemRestore"
ForceRegKey($key)
Set-ItemProperty -Path $key -Name 'DisableSR' -Value 1 -Force