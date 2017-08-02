
# Disable Network Awareness
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\NlaSvc\Parameters\Internet" -Name EnableActiveProbing -Value 0x0 -Force

