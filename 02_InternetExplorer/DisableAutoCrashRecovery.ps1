#Create the key if missing 
$key = 'HKLM:\Software\Policies\Microsoft\Internet Explorer\Recovery'
ForceRegkey($key)

#Enable the Policy
Set-ItemProperty -Path $key -Name 'AutoRecover' -Value 2 -ea SilentlyContinue 