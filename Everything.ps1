$jobs = @{}
    ## Job: DisableAutomaticProxyCache, C:\dev\VM_Setup\00_Windows\DisableAutomaticProxyCache.ps1
    $jobs.Add("\00_Windows\DisableAutomaticProxyCache.ps1", {
#Disable Automatic Proxy Result Cache
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Name EnableAutoproxyResultCache -Type DWORD -Value 0x0 -Force

    })

    ## Job: DisableErrorReporting, C:\dev\VM_Setup\00_Windows\DisableErrorReporting.ps1
    $jobs.Add("\00_Windows\DisableErrorReporting.ps1", {

# Disable Windows Error Reporting
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\Windows Error Reporting" -Name Disabled -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\AeDebug" -Name Auto -Type String -Value 1 -Force

    })

    ## Job: DisableFirewall, C:\dev\VM_Setup\00_Windows\DisableFirewall.ps1
    $jobs.Add("\00_Windows\DisableFirewall.ps1", {
# Disable Firewall
netsh advfirewall set AllProfiles state off

    })

    ## Job: DisableFontLogging, C:\dev\VM_Setup\00_Windows\DisableFontLogging.ps1
    $jobs.Add("\00_Windows\DisableFontLogging.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions') -eq $false ) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions' -force -ea SilentlyContinue } 

#Settings 
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions' -Name 'MitigationOptions_FontBocking' -Value 2000000000000 -ea SilentlyContinue 
    })

    ## Job: DisableIPv6, C:\dev\VM_Setup\00_Windows\DisableIPv6.ps1
    $jobs.Add("\00_Windows\DisableIPv6.ps1", {
# Disable IPv6
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" -Name DisabledComponents -Value 0xff -Force

    })

    ## Job: DisableLLMNR, C:\dev\VM_Setup\00_Windows\DisableLLMNR.ps1
    $jobs.Add("\00_Windows\DisableLLMNR.ps1", {
#Disable LLMNR
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" -Name EnableMulticast -Type DWORD -Value 0x0 -Force

    })

    ## Job: DisableNetBios, C:\dev\VM_Setup\00_Windows\DisableNetBios.ps1
    $jobs.Add("\00_Windows\DisableNetBios.ps1", {

#Disable NetBios
sc stop Lmhosts
sc config Lmhosts start= disabled
reg add HKLM\System\CurrentControlSet\Services\VxD\MSTCP -Name EnableDNS -Type String -Value 0 -Force

    })

    ## Job: DisableNetworkAwareness, C:\dev\VM_Setup\00_Windows\DisableNetworkAwareness.ps1
    $jobs.Add("\00_Windows\DisableNetworkAwareness.ps1", {

# Disable Network Awareness
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\NlaSvc\Parameters\Internet" -Name EnableActiveProbing -Value 0x0 -Force


    })

    ## Job: DisableSSDP, C:\dev\VM_Setup\00_Windows\DisableSSDP.ps1
    $jobs.Add("\00_Windows\DisableSSDP.ps1", {
# Disable SSDP
sc stop SSDPSRV
sc config SSDPSRV start= disabled
    })

    ## Job: DisableSystemRestore, C:\dev\VM_Setup\00_Windows\DisableSystemRestore.ps1
    $jobs.Add("\00_Windows\DisableSystemRestore.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Windows NT\SystemRestore') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\SystemRestore' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\SystemRestore' -Name 'DisableSR' -Value 1 -ea SilentlyContinue 
    })

    ## Job: DisableTeredo, C:\dev\VM_Setup\00_Windows\DisableTeredo.ps1
    $jobs.Add("\00_Windows\DisableTeredo.ps1", {
#Disable Teredo
netsh interface teredo set state disabled

    })

    ## Job: DisableTimeService, C:\dev\VM_Setup\00_Windows\DisableTimeService.ps1
    $jobs.Add("\00_Windows\DisableTimeService.ps1", {

#Disable Time Service
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\W32Time\Parameters" -Name Type -Type String -Value NoSync -Force


    })

    ## Job: DisableWindowsDefender, C:\dev\VM_Setup\00_Windows\DisableWindowsDefender.ps1
    $jobs.Add("\00_Windows\DisableWindowsDefender.ps1", {
# Disable Windows Defender

Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Type DWord -Value 1



$tasks = @(
    "\Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance"
    "\Microsoft\Windows\Windows Defender\Windows Defender Cleanup"
    "\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan"
    "\Microsoft\Windows\Windows Defender\Windows Defender Verification"
)

foreach ($task in $tasks) {
    $parts = $task.split('\')
    $name = $parts[-1]
    $path = $parts[0..($parts.length-2)] -join '\'
    
    Disable-ScheduledTask -TaskName "$name" -TaskPath "$path"
}

#"Disabling Windows Defender via Group Policies"
ForceRegKey "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows Defender"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows Defender" -Name "DisableRoutinelyTakingAction" -Type DWord -Value 1
ForceRegKey "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows Defender\Real-Time Protection"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableRealtimeMonitoring" -Type DWord -Value 1

#"Disabling Windows Defender Services"
TakeownRegistry("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend")
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\WinDefend" "Start" 4
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\WinDefend" "AutorunsDisabled" 3
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\WdNisSvc" "Start" 4
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\WdNisSvc" "AutorunsDisabled" 3
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Sense" "Start" 4
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Sense" "AutorunsDisabled" 3

#"Removing Windows Defender context menu item"
Set-Item -Path "HKLM:\SOFTWARE\Classes\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}\InprocServer32" -Value ""

#"Removing Windows Defender GUI / tray from autorun"
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "WindowsDefender" -ea 0
    })

    ## Job: DisableWPAD, C:\dev\VM_Setup\00_Windows\DisableWPAD.ps1
    $jobs.Add("\00_Windows\DisableWPAD.ps1", {
#Disable WPAD
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Wpad" -Name WpadOverride -Type DWORD -Value 0x1 -Force

    })

    ## Job: EnableCommandLineLoggingOnProcessStart, C:\dev\VM_Setup\00_Windows\EnableCommandLineLoggingOnProcessStart.ps1
    $jobs.Add("\00_Windows\EnableCommandLineLoggingOnProcessStart.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit') -eq $false ) { New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit' -Name 'ProcessCreationIncludeCmdLine_Enabled' -Value 1 -ea SilentlyContinue 
    })

    ## Job: fakeIEHistory, C:\dev\VM_Setup\00_Windows\fakeIEHistory.ps1
    $jobs.Add("\00_Windows\fakeIEHistory.ps1", {
1..100 | % {
    [System.Diagnostics.Process]::Start("http://www.randomwebsite.com/cgi-bin/random.pl")
}
    })

    ## Job: misc, C:\dev\VM_Setup\00_Windows\misc.ps1
    $jobs.Add("\00_Windows\misc.ps1", {

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


    })

    ## Job: InstallVCRedist2005, C:\dev\VM_Setup\01_CRuntime\InstallVCRedist2005.ps1
    $jobs.Add("\01_CRuntime\InstallVCRedist2005.ps1", {
#Taken from https://chocolatey.org/packages/vcredist2005

$url_32 = 'http://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE'
$sha1_32 = 'b8fab0bb7f62a24ddfe77b19cd9a1451abd7b847'

$url_64 = 'http://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE'
$sha1_64 = 'ee916012783024dac67fc606457377932c826f05'


$url = $null
$sha1 = $null

if ( [Environment]::Is64BitOperatingSystem) {
    $url = $url_64
    $sha1 = $sha1_64
} else {
    $url = $url_32
    $sha1 = $sha1_32
}

## Temporary Folder
$tmpFolder = Join-Path -Path ([System.IO.Path]::GetTempPath()) -ChildPath ("tmp_" + (Get-Random))
if (!(Test-Path $tmpFolder)) { mkdir $tmpFolder | Out-Null}

## Temp File
$tmpFile = Join-Path -Path $tmpFolder -ChildPath "install.exe"

## Download File
$response = Invoke-WebRequest -UseBasicParsing -Uri $url -OutFile $tmpFile

## Calculate Hash
$hash = (Get-FileHash -Path $tmpFile -Algorithm SHA1).Hash.ToLower()

## Verify Hash
if ($hash -ne $sha1) {
    throw "Hashes do not match!"
}

## Run file
. $tmpFile /Q

## Check exit code
if ($LASTEXITCODE -eq 0 -or $LASTEXITCODE -eq 3010) {
    ## Clean Up
    Remove-Item -Path $tmpFolder -Recurse -Force
} else {
    throw "Did not install correctly!"
}


    })

    ## Job: InstallVCRedist2008, C:\dev\VM_Setup\01_CRuntime\InstallVCRedist2008.ps1
    $jobs.Add("\01_CRuntime\InstallVCRedist2008.ps1", {

    })

    ## Job: InstallVCRedist2010, C:\dev\VM_Setup\01_CRuntime\InstallVCRedist2010.ps1
    $jobs.Add("\01_CRuntime\InstallVCRedist2010.ps1", {

    })

    ## Job: InstallVCRedist2012, C:\dev\VM_Setup\01_CRuntime\InstallVCRedist2012.ps1
    $jobs.Add("\01_CRuntime\InstallVCRedist2012.ps1", {

    })

    ## Job: InstallVCRedist2013, C:\dev\VM_Setup\01_CRuntime\InstallVCRedist2013.ps1
    $jobs.Add("\01_CRuntime\InstallVCRedist2013.ps1", {

    })

    ## Job: InstallVCRedist2015, C:\dev\VM_Setup\01_CRuntime\InstallVCRedist2015.ps1
    $jobs.Add("\01_CRuntime\InstallVCRedist2015.ps1", {

    })

    ## Job: InstallVCRedist2017, C:\dev\VM_Setup\01_CRuntime\InstallVCRedist2017.ps1
    $jobs.Add("\01_CRuntime\InstallVCRedist2017.ps1", {

    })

    ## Job: DisableActiveXFiltering, C:\dev\VM_Setup\02_InternetExplorer\DisableActiveXFiltering.ps1
    $jobs.Add("\02_InternetExplorer\DisableActiveXFiltering.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Safety\ActiveXFiltering') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Safety\ActiveXFiltering' -force -ea SilentlyContinue } 

#Disable the Policy 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Safety\ActiveXFiltering' -Name 'IsEnabled' -Value 0 -ea SilentlyContinue 

    })

    ## Job: DisableAutoCrashRecovery, C:\dev\VM_Setup\02_InternetExplorer\DisableAutoCrashRecovery.ps1
    $jobs.Add("\02_InternetExplorer\DisableAutoCrashRecovery.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Recovery') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Recovery' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Recovery' -Name 'AutoRecover' -Value 2 -ea SilentlyContinue 
    })

    ## Job: DisableBrowserGeolocation, C:\dev\VM_Setup\02_InternetExplorer\DisableBrowserGeolocation.ps1
    $jobs.Add("\02_InternetExplorer\DisableBrowserGeolocation.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Geolocation') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Geolocation' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Geolocation' -Name 'PolicyDisableGeolocation' -Value 1 -ea SilentlyContinue 
    })

    ## Job: DisablePerfCheck, C:\dev\VM_Setup\02_InternetExplorer\DisablePerfCheck.ps1
    $jobs.Add("\02_InternetExplorer\DisablePerfCheck.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Ext') -eq $false ) { New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Ext' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Ext' -Name 'DisableAddonLoadTimePerformanceNotifications' -Value 1 -ea SilentlyContinue 

    })

    ## Job: DisableSecuritySettingsCheck, C:\dev\VM_Setup\02_InternetExplorer\DisableSecuritySettingsCheck.ps1
    $jobs.Add("\02_InternetExplorer\DisableSecuritySettingsCheck.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Security') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Security' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Security' -Name 'DisableSecuritySettingsCheck' -Value 1 -ea SilentlyContinue 
    })

    ## Job: DisableSmartScreen, C:\dev\VM_Setup\02_InternetExplorer\DisableSmartScreen.ps1
    $jobs.Add("\02_InternetExplorer\DisableSmartScreen.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\PhishingFilter') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\PhishingFilter' -force -ea SilentlyContinue } 

#Settings 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\PhishingFilter' -Name 'EnabledV8' -Value 0 -ea SilentlyContinue 
    })

    ## Job: DisableSuggestedSites, C:\dev\VM_Setup\02_InternetExplorer\DisableSuggestedSites.ps1
    $jobs.Add("\02_InternetExplorer\DisableSuggestedSites.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Suggested Sites') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Suggested Sites' -force -ea SilentlyContinue } 

#Disable the Policy 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Suggested Sites' -Name 'Enabled' -Value 0 -ea SilentlyContinue 
    })

    ## Job: DisableUpdateCheck, C:\dev\VM_Setup\02_InternetExplorer\DisableUpdateCheck.ps1
    $jobs.Add("\02_InternetExplorer\DisableUpdateCheck.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions' -Name 'NoUpdateCheck' -Value 1 -ea SilentlyContinue 


#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Main') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Main' -force -ea SilentlyContinue } 

#Disable the Policy 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Main' -Name 'EnableAutoUpgrade' -Value 0 -ea SilentlyContinue 

    })

    ## Job: EnableActiveX, C:\dev\VM_Setup\02_InternetExplorer\EnableActiveX.ps1
    $jobs.Add("\02_InternetExplorer\EnableActiveX.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Ext') -eq $false ) { New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Ext' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Ext' -Name 'NoFirsttimeprompt' -Value 1 -ea SilentlyContinue 

    })

    ## Job: EnablePopUps, C:\dev\VM_Setup\02_InternetExplorer\EnablePopUps.ps1
    $jobs.Add("\02_InternetExplorer\EnablePopUps.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Restrictions') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Restrictions' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Restrictions' -Name 'NoPopupManagement' -Value 1 -ea SilentlyContinue 

    })

    ## Job: SetNewTabPage, C:\dev\VM_Setup\02_InternetExplorer\SetNewTabPage.ps1
    $jobs.Add("\02_InternetExplorer\SetNewTabPage.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\TabbedBrowsing') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\TabbedBrowsing' -force -ea SilentlyContinue } 

#Settings 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\TabbedBrowsing' -Name 'NewTabPageShow' -Value 0 -ea SilentlyContinue 
    })

    ## Job: AcceptEULA, C:\dev\VM_Setup\03_Acrobat\AcceptEULA.ps1
    $jobs.Add("\03_Acrobat\AcceptEULA.ps1", {
#Create the key if missing 
If((Test-Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\AdobeViewer') -eq $false ) { New-Item -Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\AdobeViewer' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\AdobeViewer' -Name 'EULA' -Value 1 -ea SilentlyContinue 

    })

    ## Job: DisableAutomaticUpdates, C:\dev\VM_Setup\03_Acrobat\DisableAutomaticUpdates.ps1
    $jobs.Add("\03_Acrobat\DisableAutomaticUpdates.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown') -eq $false ) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown' -force -Force } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown' -Name 'bUpdater' -Value 1 -Force
    })

    ## Job: DisableFeedback, C:\dev\VM_Setup\03_Acrobat\DisableFeedback.ps1
    $jobs.Add("\03_Acrobat\DisableFeedback.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown') -eq $false ) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown' -force -Force } 

#Disable the Policy 
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown' -Name 'bUsageMeasurement' -Value 0 -Force
    })

    ## Job: DisableInDocMessages, C:\dev\VM_Setup\03_Acrobat\DisableInDocMessages.ps1
    $jobs.Add("\03_Acrobat\DisableInDocMessages.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown\cIPM') -eq $false ) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown\cIPM' -force -Force } 

#Disable the Policy 
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown\cIPM' -Name 'bDontShowMsgWhenViewingDoc' -Value 0 -Force 
    })

    ## Job: DisableProtectedMode, C:\dev\VM_Setup\03_Acrobat\DisableProtectedMode.ps1
    $jobs.Add("\03_Acrobat\DisableProtectedMode.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown') -eq $false ) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown' -force -Force } 

#Disable the Policy 
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown' -Name 'bProtectedMode' -Value 0 -Force 

    })

    ## Job: DisableSpashScreen, C:\dev\VM_Setup\03_Acrobat\DisableSpashScreen.ps1
    $jobs.Add("\03_Acrobat\DisableSpashScreen.ps1", {
#Create the key if missing 
If((Test-Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\Originals') -eq $false ) { New-Item -Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\Originals' -force -ea SilentlyContinue } 

#Disable the Policy 
Set-ItemProperty -Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\Originals' -Name 'bDisplayAboutDialog' -Value 0 -ea SilentlyContinue 

    })

    ## Job: DisableStartUpMessages, C:\dev\VM_Setup\03_Acrobat\DisableStartUpMessages.ps1
    $jobs.Add("\03_Acrobat\DisableStartUpMessages.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown\cIPM') -eq $false ) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown\cIPM' -force -Force } 

#Disable the Policy 
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown\cIPM' -Name 'bShowMsgAtLaunch' -Value 0 -Force 
    })

    ## Job: EnableJS, C:\dev\VM_Setup\03_Acrobat\EnableJS.ps1
    $jobs.Add("\03_Acrobat\EnableJS.ps1", {
#Create the key if missing 
If((Test-Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\JSPrefs') -eq $false ) { New-Item -Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\JSPrefs' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\JSPrefs' -Name 'bEnableJS' -Value 1 -ea SilentlyContinue 

    })

    ## Job: TrustWindowsZones, C:\dev\VM_Setup\03_Acrobat\TrustWindowsZones.ps1
    $jobs.Add("\03_Acrobat\TrustWindowsZones.ps1", {
#Create the key if missing 
If((Test-Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\TrustManager') -eq $false ) { New-Item -Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\TrustManager' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKCU:\Software\Adobe\Acrobat Reader\2017\TrustManager' -Name 'bTrustOSTrustedSites' -Value 1 -ea SilentlyContinue 

    })

    ## Job: DisableBuiltinDNS, C:\dev\VM_Setup\03_Chrome\DisableBuiltinDNS.ps1
    $jobs.Add("\03_Chrome\DisableBuiltinDNS.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Google\Chrome') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Google\Chrome' -force -Force } 

#Disable the Policy 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Google\Chrome' -Name 'BuiltInDnsClientEnabled' -Value 0 -Force 
    })

    ## Job: DisableSafeBrowsing, C:\dev\VM_Setup\03_Chrome\DisableSafeBrowsing.ps1
    $jobs.Add("\03_Chrome\DisableSafeBrowsing.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Google\Chrome') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Google\Chrome' -force -Force } 

#Disable the Policy 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Google\Chrome' -Name 'SafeBrowsingEnabled' -Value 0 -Force 
    })

    ## Job: DisableSafeSearch, C:\dev\VM_Setup\03_Chrome\DisableSafeSearch.ps1
    $jobs.Add("\03_Chrome\DisableSafeSearch.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Google\Chrome') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Google\Chrome' -force -Force } 

#Disable the Policy 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Google\Chrome' -Name 'ForceGoogleSafeSearch' -Value 0 -Force 

    })

    ## Job: DisableUpdates, C:\dev\VM_Setup\03_Chrome\DisableUpdates.ps1
    $jobs.Add("\03_Chrome\DisableUpdates.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Google\Update') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Google\Update' -force} 

#Settings 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Google\Update' -Name 'UpdateDefault' -Value 0 -Force

#Settings 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Google\Update' -Name 'AutoUpdateCheckPeriodMinutes' -Value 0 -Force
    })

    ## Job: DisableAddOnWizard, C:\dev\VM_Setup\03_Firefox\DisableAddOnWizard.ps1
    $jobs.Add("\03_Firefox\DisableAddOnWizard.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Mozilla\Firefox') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -Name 'DisableAddonWizard' -Value 1 -ea SilentlyContinue 
    })

    ## Job: DisableAutomaticUpdates, C:\dev\VM_Setup\03_Firefox\DisableAutomaticUpdates.ps1
    $jobs.Add("\03_Firefox\DisableAutomaticUpdates.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Mozilla\Firefox') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -force -ea SilentlyContinue } 

#Settings 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -Name 'DisableUpdate' -Value 1 -ea SilentlyContinue 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -Name 'DisableExtensionsUpdate' -Value 1 -ea SilentlyContinue 
Set-ItemProperty -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -Name 'DisableSearchUpdate' -Value 1 -ea SilentlyContinue 

    })

    ## Job: DisableDefaultBrowserCheck, C:\dev\VM_Setup\03_Firefox\DisableDefaultBrowserCheck.ps1
    $jobs.Add("\03_Firefox\DisableDefaultBrowserCheck.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Mozilla\Firefox') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -Name 'DisableDefaultCheck' -Value 1 -ea SilentlyContinue 

    })

    ## Job: DisableKnowYourRights, C:\dev\VM_Setup\03_Firefox\DisableKnowYourRights.ps1
    $jobs.Add("\03_Firefox\DisableKnowYourRights.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Mozilla\Firefox') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -Name 'DisableRights' -Value 1 -ea SilentlyContinue 

    })

    ## Job: DisableTelemetry, C:\dev\VM_Setup\03_Firefox\DisableTelemetry.ps1
    $jobs.Add("\03_Firefox\DisableTelemetry.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Mozilla\Firefox') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -Name 'DisableTelemetry' -Value 1 -ea SilentlyContinue 

    })

    ## Job: DisableWhatsNew, C:\dev\VM_Setup\03_Firefox\DisableWhatsNew.ps1
    $jobs.Add("\03_Firefox\DisableWhatsNew.ps1", {
#Create the key if missing 
If((Test-Path 'HKLM:\Software\Policies\Mozilla\Firefox') -eq $false ) { New-Item -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -force -ea SilentlyContinue } 

#Enable the Policy
Set-ItemProperty -Path 'HKLM:\Software\Policies\Mozilla\Firefox' -Name 'SupressUpdatePage' -Value 1 -ea SilentlyContinue 

    })

    ## Job: _Common, C:\dev\VM_Setup\03_Office\_Common.ps1
    $jobs.Add("\03_Office\_Common.ps1", {

    })

    ## Job: DisableAppSecurity, C:\dev\VM_Setup\03_Office\2010\DisableAppSecurity.ps1
    $jobs.Add("\03_Office\2010\DisableAppSecurity.ps1", {
#--------------------- Office 2010
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Common\Security" -Name DRMEncryptProperty -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Common\Security" -Name Disable -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Common\Security\FileValidation" -Name DisableReporting -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Common" -Name UpdateReliabilityData -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Common" -Name EnableGKLogging -Type DWORD -Value 0x3 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\Shared Tools\Graphics Filters\Import\CDR" -Type DWORD -Value 0x1 -Force

## Word
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Word\Security" -Name VBAWarnings -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Word\Security" -Name EnableDEP -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Word\Security" -Name AccessVBOM -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Word\Security\FileBlock" -Name Word95Files -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Word\Security\FileBlock" -Name Word60Files -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Word\Security\FileBlock" -Name Word2Files -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Word\Security\ProtectedView" -Name DisableInternetFilesInPV -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Word\Security\ProtectedView" -Name DisableAttachementsInPV -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Word\Security\ProtectedView" -Name DisableUnsafeLocationsInPV -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Word\Security" -Name EnableGKOnLoad -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Word\Security" -Name EnableGKOnSave -Type DWORD -Value 0x0 -Force

## PowerPoint
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\PowerPoint\Security" -Name EnableGKOnLoad -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\PowerPoint\Security" -Name EnableGKOnSave -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\PowerPoint\Security" -Name AccessVBOM -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\PowerPoint\Security" -Name VBAWarnings -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\PowerPoint\Security" -Name EnableDEP -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\PowerPoint\Security" -Name FilesBeforeVersion -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\PowerPoint\Security\FileOpenBlock" -Name FilesBeforePowerPoint97 -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\PowerPoint\Security\FileOpenBlock" -Name BinaryFiles -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\PowerPoint\Security\FileOpenBlock" -Name HTMLFiles -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\PowerPoint\Security\FileOpenBlock" -Name GraphicFilters -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\PowerPoint\Security\FileOpenBlock" -Name Outlines -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\PowerPoint\Security\ProtectedView" -Name DisableInternetFilesInPV -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\PowerPoint\Security\ProtectedView" -Name DisableAttachementsInPV -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\PowerPoint\Security\ProtectedView" -Name DisableUnsafeLocationsInPV -Type DWORD -Value 0x1 -Force

## Excel
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Excel\Security" -Name VBAWarnings -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Excel\Security" -Name EnableDEP -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Excel\Security" -Name DataConnectionWarnings -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Excel\Security" -Name WorkbookLinkWarnings -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Excel\Security" -Name FilesBeforeVersion -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Excel\Security\FileBlock" -Name XL4Workbooks -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Excel\Security\FileBlock" -Name XL4Worksheets -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Excel\Security\FileBlock" -Name XL3Worksheets -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Excel\Security\FileBlock" -Name XL2Worksheets -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Excel\Security\FileBlock" -Name XL4Macros -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Excel\Security\FileBlock" -Name XL3Macros -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Excel\Security\FileBlock" -Name XL2Macros -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Excel\Security\ProtectedView" -Name DisableInternetFilesInPV -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Excel\Security\ProtectedView" -Name DisableAttachementsInPV -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Excel\Security\ProtectedView" -Name DisableUnsafeLocationsInPV -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Excel\Security" -Name EnableGKOnLoad -Type DWORD -Value 0x0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\14.0\Excel\Security" -Name EnableGKOnSave -Type DWORD -Value 0x0 -Force






    })

    ## Job: fakeOfficeMRU, C:\dev\VM_Setup\03_Office\2010\fakeOfficeMRU.ps1
    $jobs.Add("\03_Office\2010\fakeOfficeMRU.ps1", {

$keys = @("HKCU:\Software\Microsoft\Office\14.0\Excel\File MRU",
"HKCU:\Software\Microsoft\Office\14.0\Word\File MRU",
"HKCU:\Software\Microsoft\Office\14.0\PowerPoint\File MRU")

$baseFolder = Join-Path $home "Documents"

function RandomId {
    return [String]::Join('',(1..15 | % {"0123456789ABCDEF".ToCharArray() | Get-Random}))
}
function RandomFileName {
    return [String]::Join('',(1..20 | % {"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890".ToCharArray() | Get-Random})) + ".bin"
}


$keys | % {
    $key = $_
    1..(Get-Random -Minimum 15 -Maximum 30)| % {
        $i = $_
        $id = RandomId
        $filename = RandomFileName
        $val = "[F00000000][T0" + $id + "][O00000000]*" + $baseFolder + "\" + $filename
        New-ItemProperty $key -Name ("Item " + $i) -Value $val -PropertyType String
    }
}


$keys2 = @("HKCU:\Software\Microsoft\Office\14.0\Word\Place MRU", 
"HKCU:\Software\Microsoft\Office\14.0\PowerPoint\Place MRU",
"HKCU:\Software\Microsoft\Office\14.0\Excel\Place MRU")

$keys2 | % {
    $key = $_
    1..(Get-Random -Minimum 5 -Maximum 10)| % {
        $i = $_
        $id = RandomId
        $val = "[F00000000][T0" + $id + "][O00000000]*" + $baseFolder + "\"
        New-ItemProperty $key -Name ("Item " + $i) -Value $val -PropertyType String
    }
}

    })

#Process All Jobs
Write-Progress -Activity "Processing Jobs" -Status "Starting..."
$i = 0
$jobs.Keys | % {
    $key = $_
    $i++
    Write-Progress -Activity "Processing Jobs" -Status $key -PercentComplete ($i / $jobs.Count * 100)
    Invoke-Command -ScriptBlock $jobs[$key] -ErrorAction Stop
}
Write-Progress -Activity "Processing Jobs" -Completed


