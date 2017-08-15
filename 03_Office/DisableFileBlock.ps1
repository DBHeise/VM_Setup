@("Word", "Excel", "PowerPoint") | ForEach-Object {
    $app = $_
    $OfficeVersions | ForEach-Object {
        $version = $_
        
        ## Disable File Blocking by Version
        $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security"        
        ForceRegKey($key)
        Set-ItemProperty -Path $key -Name "FilesBeforeVersion" -Type DWORD -Value 0x0 -Force


        ## Disable File Blocking by Type

        if ($app -eq "PowerPoint") { 
            $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security\FileOpenBlock" 
        } else {
            #This isn't always correct (some versions of Office name it differently)
            $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security\FileBlock"
        }
        ForceRegKey($key)
        switch ($app) {
            "Word" {
                Set-ItemProperty -Path $key -Name "Word95Files" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "Word60Files" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "Word2Files" -Type DWORD -Value 0x0 -Force                
            }
            "Excel" {
                Set-ItemProperty -Path $key -Name "XL4Workbooks" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "XL4Worksheets" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "XL3Worksheets" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "XL2Worksheets" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "XL4Macros" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "XL3Macros" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "XL2Macros" -Type DWORD -Value 0x0 -Force
            }
            "PowerPoint" {
                Set-ItemProperty -Path $key -Name "FilesBeforePowerPoint97" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "BinaryFiles" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "HTMLFiles" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "GraphicFilters" -Type DWORD -Value 0x0 -Force
                Set-ItemProperty -Path $key -Name "Outlines" -Type DWORD -Value 0x0 -Force
            }
        }        
    }
}




