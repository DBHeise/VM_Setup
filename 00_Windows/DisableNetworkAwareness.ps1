
# Disable Network Awareness
$key = "HKLM:\System\CurrentControlSet\Services\NlaSvc\Parameters\Internet"
ForceRegKey($key)
Set-ItemProperty -Path $key -Name EnableActiveProbing -Value 0x0 -Force

