
$myPath = Split-Path $script:MyInvocation.MyCommand.Path
$scriptsInOrder = Get-ChildItem ($myPath) -Directory | ForEach-Object { Get-ChildItem (($_.FullName) + "\*.ps1") -Recurse } | Where-Object {!$_.Name.StartsWith("~")} | Sort-Object

$outFile = ".\Everything.ps1"

$dateTime = [DateTime]::UtcNow
$header = @"
## Created: $dateTime
`$jobs = @{}
"@




$footer = @"
#Process All Jobs
Write-Progress -Activity "Processing Jobs" -Status "Starting..."
`$i = 0
`$jobs.Keys | % {
    `$key = `$_
    `$i++
    Write-Progress -Activity "Processing Jobs" -Status `$key -PercentComplete (`$i / `$jobs.Count * 100)
    Invoke-Command -ScriptBlock `$jobs[`$key] -ErrorAction Stop
}
Write-Progress -Activity "Processing Jobs" -Completed


"@


$header | Set-Content -Path $outFile
$scriptsInOrder | % { 
    $shortname = $_.Name.Replace(".ps1","")
    $longname = $_.FullName.Replace($pwd, "")
    $scriptBlock = Get-Content -Path $_ -Raw

    if ($shortname.StartsWith("_")) {
        $scriptBlock | Add-Content -Path $outFile
    } else {
        $jobBody = @"

## Job: $shortname, $_
`$jobs.Add("$longname", {
$scriptBlock
})

"@
    $jobBody | Add-Content -Path $outFile
    }
}
$footer | Add-Content -Path $outFile


