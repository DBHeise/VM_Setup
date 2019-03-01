$key = $AdobeReaderPolicyFLKey + "\cIPM"
#Create the key if missing 
ForceRegKey($key)

#Disable the Policy 
Set-ItemProperty -Path $key -Name 'bDontShowMsgWhenViewingDoc' -Value 0 -Force 