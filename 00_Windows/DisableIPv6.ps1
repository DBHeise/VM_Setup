# Disable IPv6
ForceRegKey("HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters")
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" -Name DisabledComponents -Value 0xff -Force
