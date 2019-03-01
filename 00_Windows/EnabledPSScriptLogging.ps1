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
