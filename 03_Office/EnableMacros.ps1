$key = "HKCU:\Software\Policies\Microsoft\Office\Common\Security"
ForceRegKey($key)
Set-ItemProperty -Path $key -Name "automationsecurity" -value 1 -Force