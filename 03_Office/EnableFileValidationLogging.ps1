$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name EnableGKLogging -Type DWORD -Value 0x3 -Force
}