function Remove-ScheduledTask {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(       
        [Parameter(Mandatory = $true )][String] $TaskName,       
        [Parameter(Mandatory = $true )][String] $TaskPath        
    )

    $Schedule = New-Object -ComObject 'Schedule.Service'

    try {
        $Schedule.Connect($env:COMPUTERNAME)
        $TaskFolder = $Schedule.GetFolder($TaskPath)
        if ($PSCmdlet.ShouldProcess($Path,'Deleting Task')) {
            $TaskFolder.DeleteTask($TaskName,0)
        }
    } catch {
        Write-Error $_.exception.message
    }
}