
@("Word", "Excel", "PowerPoint", "Publisher", "MS Project", "Visio") | ForEach-Object {
    $app = $_
    $OfficeVersions | ForEach-Object {
        $version = $_
        $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security"
        ForceRegKey($key)
        Set-ItemProperty -Path $key -Name "Level" -Type DWORD -Value 0x0 -Force
    }
}
