## Created: 03/01/2019 20:03:04
$jobs = @{}
function ForceRegKey ($path) {
    if (!(Test-path $path)) {
        New-Item -Path $path -ItemType Directory -Force | Out-Null
    }
}

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
$definition = @"
    using System;
    using System.Runtime.InteropServices;
    namespace Win32Api
    {
        public class NtDll
        {
            [DllImport("ntdll.dll", EntryPoint="RtlAdjustPrivilege")]
            public static extern int RtlAdjustPrivilege(ulong Privilege, bool Enable, bool CurrentThread, ref bool Enabled);
        }
    }
"@
                     
if (-not ("Win32Api.NtDll" -as [type])) 
{
    Add-Type -TypeDefinition $definition -PassThru | out-null
}
else
{
    ("Win32Api.NtDll" -as [type]) | Out-Null
}

function TakeownRegistry($key) {

    # Enable SeTakeOwnershipPrivilege
    $bEnabled = $false
    $res = [Win32Api.NtDll]::RtlAdjustPrivilege(9, $true, $false, [ref]$bEnabled)

    $firstPart = $key.split('\')[0]
    $hive = $null
    $subkey = $null
    switch ($firstPart) {
        "HKEY_CLASSES_ROOT" {
            $hive = [Microsoft.Win32.Registry]::ClassesRoot
            $subkey = $key.substring($firstPart.length + 1)
        }
        "HKEY_CURRENT_USER" {
            $hive = [Microsoft.Win32.Registry]::CurrentUser
            $subkey = $key.substring($firstPart.length + 1)
        }
        "HKEY_LOCAL_MACHINE" {
            $hive = [Microsoft.Win32.Registry]::LocalMachine
            $subkey = $key.substring($firstPart.length + 1)
        }
    }

    # get administraor group
    $admins = New-Object System.Security.Principal.SecurityIdentifier("S-1-5-32-544")
    $admins = $admins.Translate([System.Security.Principal.NTAccount])

    # set owner
    $key = $hive.OpenSubKey($subkey, "ReadWriteSubTree", "TakeOwnership")
    $acl = $key.GetAccessControl()
    $acl.SetOwner($admins)
    $key.SetAccessControl($acl)

    # set FullControl
    $acl = $key.GetAccessControl()
    $rule = New-Object System.Security.AccessControl.RegistryAccessRule($admins, "FullControl", "Allow")
    $acl.SetAccessRule($rule)
    $key.SetAccessControl($acl)

}



## Job: ChangePSExecutionPolicty, H:\dev.public\VM_Setup\00_Windows\ChangePSExecutionPolicty.ps1
$jobs.Add("\00_Windows\ChangePSExecutionPolicty.ps1", {
Set-ExecutionPolicy -ExecutionPolicy Bypass -Force 
})


## Job: DisableAutomaticProxyCache, H:\dev.public\VM_Setup\00_Windows\DisableAutomaticProxyCache.ps1
$jobs.Add("\00_Windows\DisableAutomaticProxyCache.ps1", {
#Disable Automatic Proxy Result Cache
$key = "HKCU:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings"
ForceRegKey($key)
Set-ItemProperty -Path  $key -Name EnableAutoproxyResultCache -Type DWORD -Value 0x0 -Force

})


## Job: DisableErrorReporting, H:\dev.public\VM_Setup\00_Windows\DisableErrorReporting.ps1
$jobs.Add("\00_Windows\DisableErrorReporting.ps1", {

# Disable Windows Error Reporting
ForceRegKey("HKLM:\Software\Policies\Microsoft\PCHealth\ErrorReporting")
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\PCHealth\ErrorReporting" -Name DoReport -Type DWORD -Value 0x0 -Force

ForceRegkey("HKLM:\Software\Microsoft\Windows\Windows Error Reporting")
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\Windows Error Reporting" -Name Disabled -Type DWORD -Value 0x1 -Force

ForceRegKey("HKLM:\Software\Microsoft\Windows NT\CurrentVersion\AeDebug")
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\AeDebug" -Name Auto -Type String -Value 1 -Force

})


## Job: DisableFirewall, H:\dev.public\VM_Setup\00_Windows\DisableFirewall.ps1
$jobs.Add("\00_Windows\DisableFirewall.ps1", {
# Disable Firewall
netsh advfirewall set AllProfiles state off

})


## Job: DisableFontLogging, H:\dev.public\VM_Setup\00_Windows\DisableFontLogging.ps1
$jobs.Add("\00_Windows\DisableFontLogging.ps1", {
$key = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions'
ForceRegKey($key)
Set-ItemProperty -Path $key -Name 'MitigationOptions_FontBocking' -Value 2000000000000 -ea SilentlyContinue 
})


## Job: DisableIPv6, H:\dev.public\VM_Setup\00_Windows\DisableIPv6.ps1
$jobs.Add("\00_Windows\DisableIPv6.ps1", {
# Disable IPv6
ForceRegKey("HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters")
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" -Name DisabledComponents -Value 0xff -Force

})


## Job: DisableLLMNR, H:\dev.public\VM_Setup\00_Windows\DisableLLMNR.ps1
$jobs.Add("\00_Windows\DisableLLMNR.ps1", {
#Disable LLMNR
$key = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient"
ForceRegKey($key)
Set-ItemProperty -Path $key -Name EnableMulticast -Type DWORD -Value 0x0 -Force

})


## Job: DisableNetBios, H:\dev.public\VM_Setup\00_Windows\DisableNetBios.ps1
$jobs.Add("\00_Windows\DisableNetBios.ps1", {

#Disable NetBios
Stop-Service -Name lmhosts -Force
Set-Service -Name lmhosts -StartupType Disabled
$key = "HKLM:\System\CurrentControlSet\Services\VxD\MSTCP"
ForceRegkey($key)
Set-ItemProperty -Path $key -Name EnableDNS -Type String -Value 0 -Force

})


## Job: DisableNetworkAwareness, H:\dev.public\VM_Setup\00_Windows\DisableNetworkAwareness.ps1
$jobs.Add("\00_Windows\DisableNetworkAwareness.ps1", {

# Disable Network Awareness
$key = "HKLM:\System\CurrentControlSet\Services\NlaSvc\Parameters\Internet"
ForceRegKey($key)
Set-ItemProperty -Path $key -Name EnableActiveProbing -Value 0x0 -Force


})


## Job: DisableSSDP, H:\dev.public\VM_Setup\00_Windows\DisableSSDP.ps1
$jobs.Add("\00_Windows\DisableSSDP.ps1", {
# Disable SSDP
Stop-Service -Name SSDPSRV -Force
Set-Service -Name SSDPSRV -StartupType Disabled

})


## Job: DisableSystemRestore, H:\dev.public\VM_Setup\00_Windows\DisableSystemRestore.ps1
$jobs.Add("\00_Windows\DisableSystemRestore.ps1", {
$key = "HKLM:\Software\Policies\Microsoft\Windows NT\SystemRestore"
ForceRegKey($key)
Set-ItemProperty -Path $key -Name 'DisableSR' -Value 1 -Force
})


## Job: DisableTeredo, H:\dev.public\VM_Setup\00_Windows\DisableTeredo.ps1
$jobs.Add("\00_Windows\DisableTeredo.ps1", {
#Disable Teredo
netsh interface teredo set state disabled

})


## Job: DisableTimeService, H:\dev.public\VM_Setup\00_Windows\DisableTimeService.ps1
$jobs.Add("\00_Windows\DisableTimeService.ps1", {

#Disable Time Service
ForceRegKey("HKLM:\System\CurrentControlSet\Services\W32Time\Parameters")
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\W32Time\Parameters" -Name Type -Type String -Value NoSync -Force


})


## Job: DisableWindowsDefender, H:\dev.public\VM_Setup\00_Windows\DisableWindowsDefender.ps1
$jobs.Add("\00_Windows\DisableWindowsDefender.ps1", {
# Disable Windows Defender
if (Test-Path "HKLM:\Software\Policies\Microsoft\Windows Defender") {
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
        Remove-ScheduledTask -TaskName "$name" -TaskPath "$path"
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
}
})


## Job: DisableWPAD, H:\dev.public\VM_Setup\00_Windows\DisableWPAD.ps1
$jobs.Add("\00_Windows\DisableWPAD.ps1", {
#Disable WPAD
ForceRegKey("HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Wpad")
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Wpad" -Name WpadOverride -Type DWORD -Value 0x1 -Force

})


## Job: EnableCommandLineLoggingOnProcessStart, H:\dev.public\VM_Setup\00_Windows\EnableCommandLineLoggingOnProcessStart.ps1
$jobs.Add("\00_Windows\EnableCommandLineLoggingOnProcessStart.ps1", {
$key = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit'
#Create the key if missing 
ForceRegKey $key

#Enable the Policy
Set-ItemProperty -Path $key -Name 'ProcessCreationIncludeCmdLine_Enabled' -Value 1 -ea SilentlyContinue 
})


## Job: EnabledPSScriptLogging, H:\dev.public\VM_Setup\00_Windows\EnabledPSScriptLogging.ps1
$jobs.Add("\00_Windows\EnabledPSScriptLogging.ps1", {
## Script Block Logging
$key = "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
ForceRegkey($key)
Set-ItemProperty -Path $key -Name "EnableScriptBlockLogging" -Type DWORD -Value 0x1 -Force
Set-ItemProperty -Path $key -Name "EnableScriptBlockInvocationLogging" -Type DWORD -Value 0x1 -Force

## System-Wide Transcription
#$key = "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\Transcription"
#ForceRegKey($key)
#Set-ItemProperty -Path $key -Name "EnableTranscripting" -Type DWORD -Value 0x1 -Force
#Set-ItemProperty -Path $key -Name "IncludeInvocationHeader" -Type DWORD -Value 0x1 -Force
#Set-ItemProperty -Path $key -Name "OutputDirectory" -Type String -Value "C:\ScriptLogs" -Force

})


## Job: misc, H:\dev.public\VM_Setup\00_Windows\misc.ps1
$jobs.Add("\00_Windows\misc.ps1", {

function Set-ItemPropertyEx {
    param(
        $Path,
        $Name,
        $Type,
        $Value,
        [Switch] $Force
    )    

    ForceRegKey($Path)
    Set-ItemProperty -Path $Path -Name $Name -Type $Type -Value $Value -Force
}


#Disable Several Windows options for Internet access via Policy
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\SQMClient\Windows" -Name CEIPEnable -Type DWORD -Value 0x0 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" -Name NoActiveProbe -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\Windows\DriverSearching" -Name DontSearchWindowsUpdate -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\SearchCompanion" -Name DisableContentFileUpdates -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name NoInternetOpenWith -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name NoWebServices -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\Windows\TabletPC" -Name PreventHandwritingDataSharing -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\Messenger\Client" -Name CEIP -Type DWORD -Value 0x0 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name NoPublishingWizard -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name NoOnlinePrintsWizard -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\Windows\Registration Wizard Control" -Name NoRegistration -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\Windows\Internet Connection Wizard" -Name ExitOnMSICW -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\PCHealth\HelpSvc" -Name MicrosoftKBSearch -Type DWORD -Value 0x0 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\PCHealth\HelpSvc" -Name Headlines -Type DWORD -Value 0x0 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\Windows\HandwritingErrorReports" -Name PreventHandwritingErrorReports -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Printers" -Name DisableHTTPPrinting -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Printers" -Name DisableWebPnPDownload -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\EventViewer" -Name MicrosoftEventVwrDisableLinks -Type DWORD -Value 0x1 -Force
Set-ItemPropertyEx -Path "HKLM:\Software\Policies\Microsoft\SystemCertificates\AuthRoot" -Name DisableRootAutoUpdate DWORD -Value 0x1 -Force


})


## Job: DisableJavaUpdateScheduler, H:\dev.public\VM_Setup\01_Java\DisableJavaUpdateScheduler.ps1
$jobs.Add("\01_Java\DisableJavaUpdateScheduler.ps1", {

Remove-ItemProperty -Path "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" -Name "SunJavaUpdateSched" -Force
Remove-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "SunJavaUpdateSched" -Force

$jusched="C:\Program Files\Common Files\Java\Java Update\jusched.exe"

if (Test-Path $jusched) {
	Rename-Item -Path $jusched -NewName ($jusched + ".bak")
}

$jusched="C:\Program Files (86)\Common Files\Java\Java Update\jusched.exe"
if (Test-Path $jusched) {
	Rename-Item -Path $jusched -NewName ($jusched + ".bak")
}




})


## Job: DisableActiveXFiltering, H:\dev.public\VM_Setup\02_InternetExplorer\DisableActiveXFiltering.ps1
$jobs.Add("\02_InternetExplorer\DisableActiveXFiltering.ps1", {
#Create the key if missing 
$key = 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Safety\ActiveXFiltering'
ForceRegkey($key)
#Disable the Policy 
Set-ItemProperty -Path $key -Name 'IsEnabled' -Value 0 -Force

})


## Job: DisableAutoCrashRecovery, H:\dev.public\VM_Setup\02_InternetExplorer\DisableAutoCrashRecovery.ps1
$jobs.Add("\02_InternetExplorer\DisableAutoCrashRecovery.ps1", {
#Create the key if missing 
$key = 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Recovery'
ForceRegkey($key)

#Enable the Policy
Set-ItemProperty -Path $key -Name 'AutoRecover' -Value 2 -ea SilentlyContinue 
})


## Job: DisableBrowserGeolocation, H:\dev.public\VM_Setup\02_InternetExplorer\DisableBrowserGeolocation.ps1
$jobs.Add("\02_InternetExplorer\DisableBrowserGeolocation.ps1", {
#Create the key if missing 
$key = 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Geolocation'
ForceRegKey($key)
#Enable the Policy
Set-ItemProperty -Path $key -Name 'PolicyDisableGeolocation' -Value 1 -Force
})


## Job: DisablePerfCheck, H:\dev.public\VM_Setup\02_InternetExplorer\DisablePerfCheck.ps1
$jobs.Add("\02_InternetExplorer\DisablePerfCheck.ps1", {
#Create the key if missing 
$key = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Ext"
ForceRegKey($key)
#Enable the Policy
Set-ItemProperty -Path $key -Name 'DisableAddonLoadTimePerformanceNotifications' -Value 1 -Force
})


## Job: DisableSecuritySettingsCheck, H:\dev.public\VM_Setup\02_InternetExplorer\DisableSecuritySettingsCheck.ps1
$jobs.Add("\02_InternetExplorer\DisableSecuritySettingsCheck.ps1", {
#Create the key if missing 
$key = "HKLM:\Software\Policies\Microsoft\Internet Explorer\Security"
ForceRegKey($key)
#Enable the Policy
Set-ItemProperty -Path $key -Name 'DisableSecuritySettingsCheck' -Value 1 -Force
})


## Job: DisableSmartScreen, H:\dev.public\VM_Setup\02_InternetExplorer\DisableSmartScreen.ps1
$jobs.Add("\02_InternetExplorer\DisableSmartScreen.ps1", {
#Create the key if missing 
$key = "HKLM:\Software\Policies\Microsoft\Internet Explorer\PhishingFilter"
ForceRegKey($key)

#Settings 
Set-ItemProperty -Path $key -Name 'EnabledV8' -Value 0 -Force
})


## Job: DisableSuggestedSites, H:\dev.public\VM_Setup\02_InternetExplorer\DisableSuggestedSites.ps1
$jobs.Add("\02_InternetExplorer\DisableSuggestedSites.ps1", {
#Create the key if missing 
$key = "HKLM:\Software\Policies\Microsoft\Internet Explorer\Suggested Sites"
ForceRegKey($key)

#Disable the Policy 
Set-ItemProperty -Path $key -Name 'Enabled' -Value 0 -Force
})


## Job: DisableUpdateCheck, H:\dev.public\VM_Setup\02_InternetExplorer\DisableUpdateCheck.ps1
$jobs.Add("\02_InternetExplorer\DisableUpdateCheck.ps1", {
#Create the key if missing 
$key = "HKLM:\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions"
ForceRegKey($key)
#Enable the Policy
Set-ItemProperty -Path $key -Name 'NoUpdateCheck' -Value 1 -Force


#Create the key if missing 
$key = "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main"
ForceRegKey($key)
#Disable the Policy 
Set-ItemProperty -Path $key -Name 'EnableAutoUpgrade' -Value 0 -ea SilentlyContinue 

})


## Job: EnableActiveX, H:\dev.public\VM_Setup\02_InternetExplorer\EnableActiveX.ps1
$jobs.Add("\02_InternetExplorer\EnableActiveX.ps1", {
#Create the key if missing 
$key = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Ext"
ForceRegkey($key)
#Enable the Policy
Set-ItemProperty -Path $key -Name 'NoFirsttimeprompt' -Value 1 -ea SilentlyContinue 

})


## Job: EnablePopUps, H:\dev.public\VM_Setup\02_InternetExplorer\EnablePopUps.ps1
$jobs.Add("\02_InternetExplorer\EnablePopUps.ps1", {
#Create the key if missing 
$key ="HKLM:\Software\Policies\Microsoft\Internet Explorer\Restrictions"
ForceRegkey($key)

#Enable the Policy
Set-ItemProperty -Path $key -Name 'NoPopupManagement' -Value 1 -ea SilentlyContinue 

})


## Job: fakeIEHistory, H:\dev.public\VM_Setup\02_InternetExplorer\fakeIEHistory.ps1
$jobs.Add("\02_InternetExplorer\fakeIEHistory.ps1", {
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

})


## Job: SetNewTabPage, H:\dev.public\VM_Setup\02_InternetExplorer\SetNewTabPage.ps1
$jobs.Add("\02_InternetExplorer\SetNewTabPage.ps1", {
#Create the key if missing 
$key = "HKLM:\Software\Policies\Microsoft\Internet Explorer\TabbedBrowsing"
ForceRegKey($key)

#Settings 
Set-ItemProperty -Path $key -Name 'NewTabPageShow' -Value 0 -ea SilentlyContinue 
})

$AdobeReaderBaseKey = 'HKCU:\Software\Adobe\Acrobat Reader\2017\AdobeViewer'

#Create the key if missing 
ForceRegKey($AdobeReaderBaseKey)

$AdobeReaderPolicyFLKey = 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown'

#Create the key if missing 
ForceRegKey($AdobeReaderPolicyFLKey)


## Job: AcceptEULA, H:\dev.public\VM_Setup\03_Acrobat\AcceptEULA.ps1
$jobs.Add("\03_Acrobat\AcceptEULA.ps1", {

#Enable the Policy
Set-ItemProperty -Path $AdobeReaderBaseKey -Name 'EULA' -Value 1 -ea SilentlyContinue 

})


## Job: DisableAutomaticUpdates, H:\dev.public\VM_Setup\03_Acrobat\DisableAutomaticUpdates.ps1
$jobs.Add("\03_Acrobat\DisableAutomaticUpdates.ps1", {

#Enable the Policy
Set-ItemProperty -Path $AdobeReaderPolicyFLKey -Name 'bUpdater' -Value 1 -Force
})


## Job: DisableFeedback, H:\dev.public\VM_Setup\03_Acrobat\DisableFeedback.ps1
$jobs.Add("\03_Acrobat\DisableFeedback.ps1", {

#Disable the Policy 
Set-ItemProperty -Path $AdobeReaderPolicyFLKey -Name 'bUsageMeasurement' -Value 0 -Force
})


## Job: DisableInDocMessages, H:\dev.public\VM_Setup\03_Acrobat\DisableInDocMessages.ps1
$jobs.Add("\03_Acrobat\DisableInDocMessages.ps1", {
$key = $AdobeReaderPolicyFLKey + "\cIPM"
#Create the key if missing 
ForceRegKey($key)

#Disable the Policy 
Set-ItemProperty -Path $key -Name 'bDontShowMsgWhenViewingDoc' -Value 0 -Force 
})


## Job: DisableProtectedMode, H:\dev.public\VM_Setup\03_Acrobat\DisableProtectedMode.ps1
$jobs.Add("\03_Acrobat\DisableProtectedMode.ps1", {

#Disable the Policy 
Set-ItemProperty -Path $AdobeReaderPolicyFLKey -Name 'bProtectedMode' -Value 0 -Force 

})


## Job: DisableSpashScreen, H:\dev.public\VM_Setup\03_Acrobat\DisableSpashScreen.ps1
$jobs.Add("\03_Acrobat\DisableSpashScreen.ps1", {

#Disable the Policy 
Set-ItemProperty -Path $AdobeReaderPolicyFLKey -Name 'bDisplayAboutDialog' -Value 0 -ea SilentlyContinue 

})


## Job: DisableStartUpMessages, H:\dev.public\VM_Setup\03_Acrobat\DisableStartUpMessages.ps1
$jobs.Add("\03_Acrobat\DisableStartUpMessages.ps1", {
$key = $AdobeReaderPolicyFLKey + "\cIPM"
#Create the key if missing 
ForceRegKey($key)

#Disable the Policy 
Set-ItemProperty -Path $key -Name 'bShowMsgAtLaunch' -Value 0 -Force 
})


## Job: EnableJS, H:\dev.public\VM_Setup\03_Acrobat\EnableJS.ps1
$jobs.Add("\03_Acrobat\EnableJS.ps1", {
$key = 'HKCU:\Software\Adobe\Acrobat Reader\2017\JSPrefs'
#Create the key if missing 
ForceRegKey($key)

#Enable the Policy
Set-ItemProperty -Path $key -Name 'bEnableJS' -Value 1 -ea SilentlyContinue 

})


## Job: TrustWindowsZones, H:\dev.public\VM_Setup\03_Acrobat\TrustWindowsZones.ps1
$jobs.Add("\03_Acrobat\TrustWindowsZones.ps1", {

$key = 'HKCU:\Software\Adobe\Acrobat Reader\2017\TrustManager' 
#Create the key if missing 
ForceRegKey($key)

#Enable the Policy
Set-ItemProperty -Path $key -Name 'bTrustOSTrustedSites' -Value 1 -ea SilentlyContinue 

})

$chromePolicyKey = 'HKLM:\Software\Policies\Google\Chrome'

#Create the key if missing 
ForceRegKey($chromePolicyKey)


## Job: DisableBuiltinDNS, H:\dev.public\VM_Setup\03_Chrome\DisableBuiltinDNS.ps1
$jobs.Add("\03_Chrome\DisableBuiltinDNS.ps1", {

#Disable the Policy 
Set-ItemProperty -Path $chromePolicyKey -Name 'BuiltInDnsClientEnabled' -Value 0 -Force 
})


## Job: DisableSafeBrowsing, H:\dev.public\VM_Setup\03_Chrome\DisableSafeBrowsing.ps1
$jobs.Add("\03_Chrome\DisableSafeBrowsing.ps1", {

#Disable the Policy 
Set-ItemProperty -Path $chromePolicyKey -Name 'SafeBrowsingEnabled' -Value 0 -Force 
})


## Job: DisableSafeSearch, H:\dev.public\VM_Setup\03_Chrome\DisableSafeSearch.ps1
$jobs.Add("\03_Chrome\DisableSafeSearch.ps1", {

#Disable the Policy 
Set-ItemProperty -Path $chromePolicyKey -Name 'ForceGoogleSafeSearch' -Value 0 -Force 

})


## Job: DisableUpdates, H:\dev.public\VM_Setup\03_Chrome\DisableUpdates.ps1
$jobs.Add("\03_Chrome\DisableUpdates.ps1", {
$chromeUpdateKey = 'HKLM:\Software\Policies\Google\Update'

#Create the key if missing 
ForceRegKey($chromeUpdateKey)

#Settings 
Set-ItemProperty -Path $chromeUpdateKey -Name 'UpdateDefault' -Value 0 -Force

#Settings 
Set-ItemProperty -Path $chromeUpdateKey -Name 'AutoUpdateCheckPeriodMinutes' -Value 0 -Force
})

$FireFoxBasePolicyRegKey = 'HKLM:\Software\Policies\Mozilla\Firefox'

ForceRegKey($FireFoxBasePolicyRegKey)


## Job: DisableAddOnWizard, H:\dev.public\VM_Setup\03_Firefox\DisableAddOnWizard.ps1
$jobs.Add("\03_Firefox\DisableAddOnWizard.ps1", {

#Enable the Policy
Set-ItemProperty -Path $FireFoxBasePolicyRegKey-Name 'DisableAddonWizard' -Value 1 -ea SilentlyContinue 
})


## Job: DisableAutomaticUpdates, H:\dev.public\VM_Setup\03_Firefox\DisableAutomaticUpdates.ps1
$jobs.Add("\03_Firefox\DisableAutomaticUpdates.ps1", {

#Settings 
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'DisableUpdate' -Value 1 -ea SilentlyContinue 
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'DisableExtensionsUpdate' -Value 1 -ea SilentlyContinue 
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'DisableSearchUpdate' -Value 1 -ea SilentlyContinue 

})


## Job: DisableDefaultBrowserCheck, H:\dev.public\VM_Setup\03_Firefox\DisableDefaultBrowserCheck.ps1
$jobs.Add("\03_Firefox\DisableDefaultBrowserCheck.ps1", {

#Enable the Policy
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'DisableDefaultCheck' -Value 1 -ea SilentlyContinue 

})


## Job: DisableKnowYourRights, H:\dev.public\VM_Setup\03_Firefox\DisableKnowYourRights.ps1
$jobs.Add("\03_Firefox\DisableKnowYourRights.ps1", {

#Enable the Policy
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'DisableRights' -Value 1 -ea SilentlyContinue 

})


## Job: DisableTelemetry, H:\dev.public\VM_Setup\03_Firefox\DisableTelemetry.ps1
$jobs.Add("\03_Firefox\DisableTelemetry.ps1", {

#Enable the Policy
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'DisableTelemetry' -Value 1 -ea SilentlyContinue 

})


## Job: DisableWhatsNew, H:\dev.public\VM_Setup\03_Firefox\DisableWhatsNew.ps1
$jobs.Add("\03_Firefox\DisableWhatsNew.ps1", {

#Enable the Policy
Set-ItemProperty -Path $FireFoxBasePolicyRegKey -Name 'SupressUpdatePage' -Value 1 -ea SilentlyContinue 

})

$OfficeVersions = Get-ChildItem -Path "HKCU:\Software\Microsoft\Office\" | Where-Object {$_.Name.Contains('.0')} | ForEach-Object { $_.PSChildName }



## Job: DisableAppSecurity, H:\dev.public\VM_Setup\03_Office\DisableAppSecurity.ps1
$jobs.Add("\03_Office\DisableAppSecurity.ps1", {
$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common\Security"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "Disable" -Type DWORD -Value 0x1 -Force
}



})


## Job: DisableDEP, H:\dev.public\VM_Setup\03_Office\DisableDEP.ps1
$jobs.Add("\03_Office\DisableDEP.ps1", {

@("Word", "Excel", "PowerPoint") | ForEach-Object {
    $app = $_
    $OfficeVersions | ForEach-Object {
        $version = $_
        $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security"
        ForceRegKey($key)
        Set-ItemProperty -Path $key -Name "EnableDEP" -Type DWORD -Value 0x0 -Force
    }
}


})


## Job: DisableDRMPropertyEncryption, H:\dev.public\VM_Setup\03_Office\DisableDRMPropertyEncryption.ps1
$jobs.Add("\03_Office\DisableDRMPropertyEncryption.ps1", {
$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common\Security"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "DRMEncryptProperty" -Type DWORD -Value 0x0 -Force
}

})


## Job: DisableFileBlock, H:\dev.public\VM_Setup\03_Office\DisableFileBlock.ps1
$jobs.Add("\03_Office\DisableFileBlock.ps1", {
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





})


## Job: DisableFileValidationReporting, H:\dev.public\VM_Setup\03_Office\DisableFileValidationReporting.ps1
$jobs.Add("\03_Office\DisableFileValidationReporting.ps1", {

$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common\Security\FileValidation"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name DisableReporting -Type DWORD -Value 0x1 -Force
}

})


## Job: DisableFirstRun, H:\dev.public\VM_Setup\03_Office\DisableFirstRun.ps1
$jobs.Add("\03_Office\DisableFirstRun.ps1", {
$OfficeVersions | ForEach-Object {
    $version = $_
    $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\FirstRun"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "disablemovie" -Type DWORD -Value 0x1 -Force
    Set-ItemProperty -Path $key -Name "bootedrtm" -Type DWORD -Value 0x1 -Force
}
})


## Job: DisableHyperlinkWarning, H:\dev.public\VM_Setup\03_Office\DisableHyperlinkWarning.ps1
$jobs.Add("\03_Office\DisableHyperlinkWarning.ps1", {
$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common\Security"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "DisableHyperlinkWarning" -Type DWORD -Value 0x1 -Force
}

})


## Job: DisableProtectedView, H:\dev.public\VM_Setup\03_Office\DisableProtectedView.ps1
$jobs.Add("\03_Office\DisableProtectedView.ps1", {
@("Word", "Excel", "PowerPoint") | ForEach-Object {
    $app = $_
    $OfficeVersions | ForEach-Object {
        $version = $_
        $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security\ProtectedView"
        ForceRegKey($key)
        Set-ItemProperty -Path $key -Name "DisableInternetFilesInPV" -Type DWORD -Value 0x1 -Force
        Set-ItemProperty -Path $key -Name "DisableAttachementsInPV" -Type DWORD -Value 0x1 -Force
        Set-ItemProperty -Path $key -Name "DisableUnsafeLocationsInPV" -Type DWORD -Value 0x1 -Force
    }
}

})


## Job: DisableReliabilityUpdate, H:\dev.public\VM_Setup\03_Office\DisableReliabilityUpdate.ps1
$jobs.Add("\03_Office\DisableReliabilityUpdate.ps1", {

$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "UpdateReliabilityData" -Type DWORD -Value 0x0 -Force
}

})


## Job: DisableVBAWarnings, H:\dev.public\VM_Setup\03_Office\DisableVBAWarnings.ps1
$jobs.Add("\03_Office\DisableVBAWarnings.ps1", {

@("Word", "Excel", "PowerPoint", "Publisher", "MS Project", "Visio") | ForEach-Object {
    $app = $_
    $OfficeVersions | ForEach-Object {
        $version = $_
        $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security"
        ForceRegKey($key)
        Set-ItemProperty -Path $key -Name "VBAWarnings" -Type DWORD -Value 0x1 -Force
    }
}

})


## Job: EnableAccessVBOM, H:\dev.public\VM_Setup\03_Office\EnableAccessVBOM.ps1
$jobs.Add("\03_Office\EnableAccessVBOM.ps1", {
@("Word", "Excel", "PowerPoint") | ForEach-Object {
    $app = $_
    $OfficeVersions | ForEach-Object {
        $version = $_
        $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security"
        ForceRegKey($key)
        Set-ItemProperty -Path $key -Name "AccessVBOM" -Type DWORD -Value 0x1 -Force
    }
}

})


## Job: EnableActiveX, H:\dev.public\VM_Setup\03_Office\EnableActiveX.ps1
$jobs.Add("\03_Office\EnableActiveX.ps1", {
#Enable All ActiveX without SafeMode

$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common\Security"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "UFIControls" -Type DWORD -Value 0x1 -Force
}
})


## Job: EnableExcelDataConnections, H:\dev.public\VM_Setup\03_Office\EnableExcelDataConnections.ps1
$jobs.Add("\03_Office\EnableExcelDataConnections.ps1", {
$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Excel\Security"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "DataConnectionWarnings" -Type DWORD -Value 0x0 -Force
}

})


## Job: EnableExcelLinkedWorkbooks, H:\dev.public\VM_Setup\03_Office\EnableExcelLinkedWorkbooks.ps1
$jobs.Add("\03_Office\EnableExcelLinkedWorkbooks.ps1", {
$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Excel\Security"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "WorkbookLinkWarnings" -Type DWORD -Value 0x0 -Force
}

})


## Job: EnableFileValidationLogging, H:\dev.public\VM_Setup\03_Office\EnableFileValidationLogging.ps1
$jobs.Add("\03_Office\EnableFileValidationLogging.ps1", {
$OfficeVersions | ForEach-Object {
    $key = "HKCU:\Software\Microsoft\Office\" + $_ + "\Common"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name EnableGKLogging -Type DWORD -Value 0x3 -Force
}
})


## Job: EnableFileValidationOnLoad, H:\dev.public\VM_Setup\03_Office\EnableFileValidationOnLoad.ps1
$jobs.Add("\03_Office\EnableFileValidationOnLoad.ps1", {
@("Word", "Excel", "PowerPoint") | ForEach-Object {
    $app = $_
    $OfficeVersions | ForEach-Object {
        $version = $_
        $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security"
        ForceRegKey($key)
        Set-ItemProperty -Path $key -Name EnableGKOnLoad -Type DWORD -Value 0x3 -Force
    }
}

})


## Job: EnableFileValidationOnSave, H:\dev.public\VM_Setup\03_Office\EnableFileValidationOnSave.ps1
$jobs.Add("\03_Office\EnableFileValidationOnSave.ps1", {
@("Word", "Excel", "PowerPoint") | ForEach-Object {
    $app = $_
    $OfficeVersions | ForEach-Object {
        $version = $_
        $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security"
        ForceRegKey($key)
        Set-ItemProperty -Path $key -Name EnableGKOnSave -Type DWORD -Value 0x3 -Force
    }
}

})


## Job: EnableMacros, H:\dev.public\VM_Setup\03_Office\EnableMacros.ps1
$jobs.Add("\03_Office\EnableMacros.ps1", {
$key = "HKCU:\Software\Policies\Microsoft\Office\Common\Security"
ForceRegKey($key)
Set-ItemProperty -Path $key -Name "automationsecurity" -value 1 -Force
})


## Job: EnableVBA, H:\dev.public\VM_Setup\03_Office\EnableVBA.ps1
$jobs.Add("\03_Office\EnableVBA.ps1", {


 $OfficeVersions | ForEach-Object {
    $version = $_
    $key = "HKCU:\Software\Microsoft\Office\" + $version + "\Common"
    ForceRegKey($key)
    Set-ItemProperty -Path $key -Name "vbaoff" -Type DWORD -Value 0 -Force
}

})


## Job: FakeOfficeMRU, H:\dev.public\VM_Setup\03_Office\FakeOfficeMRU.ps1
$jobs.Add("\03_Office\FakeOfficeMRU.ps1", {

$apps = @("Word", "Excel", "PowerPoint")

$baseFolder = Join-Path $home "Documents"

function RandomId {
    return [String]::Join('',(1..15 | % {"0123456789ABCDEF".ToCharArray() | Get-Random}))
}

function RandomFileName {
    return [String]::Join('',(1..20 | % {"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890".ToCharArray() | Get-Random})) + ".bin"
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



})


## Job: SetSecurityLevel, H:\dev.public\VM_Setup\03_Office\SetSecurityLevel.ps1
$jobs.Add("\03_Office\SetSecurityLevel.ps1", {

@("Word", "Excel", "PowerPoint", "Publisher", "MS Project", "Visio") | ForEach-Object {
    $app = $_
    $OfficeVersions | ForEach-Object {
        $version = $_
        $key = "HKCU:\Software\Microsoft\Office\" + $version + "\" + $app + "\Security"
        ForceRegKey($key)
        Set-ItemProperty -Path $key -Name "Level" -Type DWORD -Value 0x0 -Force
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


