$AdobeReaderBaseKey = 'HKCU:\Software\Adobe\Acrobat Reader\2017\AdobeViewer'

#Create the key if missing 
ForceRegKey($AdobeReaderBaseKey)

$AdobeReaderPolicyFLKey = 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\2017\FeatureLockdown'

#Create the key if missing 
ForceRegKey($AdobeReaderPolicyFLKey)
