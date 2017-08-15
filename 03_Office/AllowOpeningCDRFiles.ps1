$key = "HKCU:\Software\Microsoft\Office\Shared Tools\Graphics Filters\Import\CDR"
ForceRegKey($key)
Set-ItemProperty -Path $key -Type DWORD -Value 0x1 -Force