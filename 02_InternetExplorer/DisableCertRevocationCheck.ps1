#Disable Certificate Revocation Checks
$key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\CertificateRevocation"
ForceRegKey($key)
Set-ItemProperty -Path  $key -Name EnableAutoproxyResultCache -Type DWORD -Value 0x0 -Force
