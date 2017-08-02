
#Disable Time Service
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\W32Time\Parameters" -Name Type -Type String -Value NoSync -Force

