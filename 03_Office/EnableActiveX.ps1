#Enable All ActiveX without SafeMode

$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common\Security"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "UFIControls" -Type DWORD -Value 0x1 -Force
}