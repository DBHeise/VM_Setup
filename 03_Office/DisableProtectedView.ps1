@("Word", "Excel", "PowerPoint") | ForEach-Object {
    $app = $_
    $OfficeVersions | ForEach-Object {
        $version = $_
        $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security\ProtectedView"
        ForceRegKey($key)
        Set-ItemProperty -Path $key -Name "DisableInternetFilesInPV" -Type DWORD -Value 0x1 -Force
        Set-ItemProperty -Path $key -Name "DisableAttachementsInPV" -Type DWORD -Value 0x1 -Force
        Set-ItemProperty -Path $key -Name "DisableUnsafeLocationsInPV" -Type DWORD -Value 0x1 -Force
    }
}
