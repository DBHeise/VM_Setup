
REM Disable Several Windows options for Internet access via Policy
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\SQMClient\Windows" -Name CEIPEnable -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\PCHealth\ErrorReporting" -Name DoReport -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Error Reporting" -Name Disabled -Type DWORD -Value 0x1 -Force
REM Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate" -Name DisableWindowsUpdateAccess -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" -Name NoActiveProbe -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\DriverSearching" -Name DontSearchWindowsUpdate -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\SearchCompanion" -Name DisableContentFileUpdates -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name NoInternetOpenWith -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name NoWebServices -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\TabletPC" -Name PreventHandwritingDataSharing -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Messenger\Client" -Name CEIP -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name NoPublishingWizard -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name NoOnlinePrintsWizard -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Registration Wizard Control" -Name NoRegistration -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Internet Connection Wizard" -Name ExitOnMSICW -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\PCHealth\HelpSvc" -Name MicrosoftKBSearch -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\PCHealth\HelpSvc" -Name Headlines -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\HandwritingErrorReports" -Name PreventHandwritingErrorReports -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Printers" -Name DisableHTTPPrinting -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Printers" -Name DisableWebPnPDownload -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\EventViewer" -Name MicrosoftEventVwrDisableLinks -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\SystemCertificates\AuthRoot" -Name DisableRootAutoUpdate /DWORD -Value 0x1 -Force

