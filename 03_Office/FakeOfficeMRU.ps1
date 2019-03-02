
$apps = @("Word", "Excel", "PowerPoint")

$baseFolder = Join-Path $home "Documents"

function RandomId {
    return [String]::Join('',(1..15 | % {"0123456789ABCDEF".ToCharArray() | Get-Random}))
}
function RandomExtension($app) {
    switch ($app) {
        "Word" { return @(".doc", ".docx") | Get-Random -Count 1}
        "Excel" { return @(".xls", ".xlsb", ".xlsx") | Get-Random -Count 1}
        "PowerPoint" { return @(".ppt", ".pptx") | Get-Random -Count 1}
        Default { return ".bin"}
    }
}
function RandomFileName($app) {
    return [String]::Join('',(1..20 | % {"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890".ToCharArray() | Get-Random})) + (RandomExtension($app))
}


$OfficeVersions| % {
    $v = $_
    $apps | % { 
        $a = $_
        $key_File = "HKCU:\Software\Microsoft\Office\" + $v + "\" + $a + "\File MRU"
        $key_Place = "HKCU:\Software\Microsoft\Office\" + $v + "\" + $a + "\Place MRU"

        ForceRegKey($key_File)
        ForceRegKey($key_Place)
        
        1..(Get-Random -Minimum 15 -Maximum 30)| % {
            $i = $_
            $id = RandomId
            $filename = RandomFileName
            $val = "[F00000000][T0" + $id + "][O00000000]*" + $baseFolder + "\" + $filename
            Set-ItemProperty $key_File -Name ("Item " + $i) -Value $val -Type String -Force
        }
    
        1..(Get-Random -Minimum 5 -Maximum 10)| % {
            $i = $_
            $id = RandomId
            $val = "[F00000000][T0" + $id + "][O00000000]*" + $baseFolder + "\"
            Set-ItemProperty $key_Place -Name ("Item " + $i) -Value $val -Type String -Force
        }
    }
}


