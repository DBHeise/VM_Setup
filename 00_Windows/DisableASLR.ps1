$key = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management'
ForceRegKey($key)
Set-ItemProperty -Path $key -Name 'MoveImages' -Value 0x0 -ea SilentlyContinue 