$key = $AdobeReaderPolicyFLKey + "\cIPM"
#Create the key if missing 
ForceRegKey($key)

#Disable the Policy 
Set-ItemProperty -Path $key -Name 'bShowMsgAtLaunch' -Value 0 -Force 