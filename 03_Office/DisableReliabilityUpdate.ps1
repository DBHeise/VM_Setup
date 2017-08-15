
$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "UpdateReliabilityData" -Type DWORD -Value 0x0 -Force
}
