
#Disable the Policy 
Set-ItemProperty -Path $chromePolicyKey -Name 'BuiltInDnsClientEnabled' -Value 0 -Force 