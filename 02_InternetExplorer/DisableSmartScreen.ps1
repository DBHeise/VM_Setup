#Create the key if missing 
$key = "HKLM:\Software\Policies\Microsoft\Internet Explorer\PhishingFilter"
ForceRegKey($key)

#Settings 
Set-ItemProperty -Path $key -Name 'EnabledV8' -Value 0 -Force