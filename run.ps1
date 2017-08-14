[CmdletBinding()]
$myPath = Split-Path $script:MyInvocation.MyCommand.Path
$scriptsInOrder = Get-ChildItem ($myPath) -Directory | ForEach-Object { Get-ChildItem (($_.FullName) + "\*.ps1") -Recurse } | Where-Object {!$_.Name.StartsWith("~")} | Sort-Object


$scriptsInOrder | % { 
    $shortname = $_.Name.Replace(".ps1","")
    $longname = $_.FullName.Replace($myPath, "")
    $scriptBlock = Get-Content -Path $_ -Raw

    Write-Verbose -Message ("Running file: " + $_.FullName)

    if ($shortname.StartsWith("_")) {
        $script = Get-Content -Path $_ -Raw
        if (![String]::IsNullOrWhiteSpace($script)) {
            Invoke-Expression (gc $_ -Raw)
        }        
    } else {
        & $_.FullName
    }
}

Start-Sleep -Seconds 10