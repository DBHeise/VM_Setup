$key = 'HKCU:\Software\Adobe\Acrobat Reader\2017\JSPrefs'
#Create the key if missing 
ForceRegKey($key)

#Enable the Policy
Set-ItemProperty -Path $key -Name 'bEnableJS' -Value 1 -ea SilentlyContinue 
