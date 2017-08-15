$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common\Security"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "DisableHyperlinkWarning" -Type DWORD -Value 0x1 -Force
}
