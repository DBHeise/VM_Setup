# Disable SSDP
Stop-Service -Name SSDPSRV -Force
Set-Service -Name SSDPSRV -StartupType Disabled
