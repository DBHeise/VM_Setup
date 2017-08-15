@("Word", "Excel", "PowerPoint") | ForEach-Object {
    $app = $_
    $OfficeVersions | ForEach-Object {
        $version = $_
        $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security"
        ForceRegKey($key)
        Set-ItemProperty -Path $key -Name EnableGKOnLoad -Type DWORD -Value 0x3 -Force
    }
}
