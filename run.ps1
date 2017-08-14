$scriptsInOrder = Get-ChildItem ($pwd) -Directory | ForEach-Object { Get-ChildItem $_\*.ps1 -Recurse } | Where-Object {!$_.Name.StartsWith("~")} | Sort-Object


$scriptsInOrder | % { 
    $shortname = $_.Name.Replace(".ps1","")
    $longname = $_.FullName.Replace($pwd, "")
    $scriptBlock = Get-Content -Path $_ -Raw

    if ($shortname.StartsWith("_")) {
        $script = Get-Content -Path $_ -Raw
        if (![String]::IsNullOrWhiteSpace($script)) {
            Invoke-Expression (gc $_ -Raw)
        }        
    } else {
        & $_
    }
}