#Create the key if missing 
$key ="HKLM:\Software\Policies\Microsoft\Internet Explorer\Restrictions"
ForceRegkey($key)

#Enable the Policy
Set-ItemProperty -Path $key -Name 'NoPopupManagement' -Value 1 -ea SilentlyContinue 
