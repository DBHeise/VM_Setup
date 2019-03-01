
$key = 'HKCU:\Software\Adobe\Acrobat Reader\2017\TrustManager' 
#Create the key if missing 
ForceRegKey($key)

#Enable the Policy
Set-ItemProperty -Path $key -Name 'bTrustOSTrustedSites' -Value 1 -ea SilentlyContinue 
