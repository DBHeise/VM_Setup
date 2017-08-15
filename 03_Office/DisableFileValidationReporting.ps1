
$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common\Security\FileValidation"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name DisableReporting -Type DWORD -Value 0x1 -Force
}
