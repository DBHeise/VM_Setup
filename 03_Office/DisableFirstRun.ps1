$OfficeVersions | ForEach-Object {
    $version = $_
    $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\FirstRun"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "disablemovie" -Type DWORD -Value 0x1 -Force
    Set-ItemProperty -Path $key -Name "bootedrtm" -Type DWORD -Value 0x1 -Force
}