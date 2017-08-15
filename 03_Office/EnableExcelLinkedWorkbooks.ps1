$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Excel\Security"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "WorkbookLinkWarnings" -Type DWORD -Value 0x0 -Force
}
