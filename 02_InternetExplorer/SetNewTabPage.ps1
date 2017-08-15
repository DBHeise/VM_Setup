#Create the key if missing 
$key = "HKLM:\Software\Policies\Microsoft\Internet Explorer\TabbedBrowsing"
ForceRegKey($key)

#Settings 
Set-ItemProperty -Path $key -Name 'NewTabPageShow' -Value 0 -ea SilentlyContinue 