
@($env:ProgramFiles, ${env:ProgramFiles(x86)}) | ForEach-Object { Get-ChildItem $_\*Office } | ForEach-Object { Get-ChildItem $_ -Recurse -Include ospp.vbs } | ForEach-Object{
    Push-Location (Split-Path $_)
    cscript.exe ospp.vbs /act
    Pop-Location
}