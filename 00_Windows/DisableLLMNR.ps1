#Disable LLMNR
$key = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient"
ForceRegKey($key)
Set-ItemProperty -Path $key -Name EnableMulticast -Type DWORD -Value 0x0 -Force
