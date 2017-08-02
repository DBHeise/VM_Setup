param([String] $file) 

$replacers = @{
    "reg add `"HKLM\"="Set-ItemProperty -Path `"HKLM:\"
    "reg add HKLM\"="Set-ItemProperty -Path `"HKLM:\"
    "reg add `"HKCU\"="Set-ItemProperty -Path `"HKCU:\"
    "reg add HKCU\"="Set-ItemProperty -Path `"HKCU:\"    
    "/v"= "-Name"
    "/f"= "-Force"
    "/d"="-Value"
    "/t"="-Type"
    "REG_DWORD"="DWORD"
    "REG_SZ"="String"
    "> nul"=""
}


$data = Get-Content -Path $file -Raw

$replacers.Keys | ForEach-Object {
    $data = $data.Replace($_, $replacers[$_])
}

Set-Content -Path $file -Value $data