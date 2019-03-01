if (Test-Connection "internetbeacon.msedge.net" -Quiet) {
    $ie = New-Object -ComObject InternetExplorer.Application
    $ie.Visible = $true
    1..100 | % {        
        $ie.Navigate("http://www.uroulette.com/visit/trps")
        Start-Sleep -Seconds 1
    }
    $ie.Quit()
} else {
    ##TODO: How to fake IE history while offline
}
