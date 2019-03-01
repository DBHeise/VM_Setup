
#Disable the Policy 
Set-ItemProperty -Path $chromePolicyKey -Name 'SafeBrowsingEnabled' -Value 0 -Force 