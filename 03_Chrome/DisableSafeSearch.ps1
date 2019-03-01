
#Disable the Policy 
Set-ItemProperty -Path $chromePolicyKey -Name 'ForceGoogleSafeSearch' -Value 0 -Force 
