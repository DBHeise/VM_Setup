

 $OfficeVersions | ForEach-Object {
    $version = $_
    $key = "HKCU:\Software\Microsoft\Office\" + $version + "\Common"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "vbaoff" -Type DWORD -Value 0 -Force
}
