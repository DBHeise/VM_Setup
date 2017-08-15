$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common\Security"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "Disable" -Type DWORD -Value 0x1 -Force
}


