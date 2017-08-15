$OfficeVersions = Get-ChildItem -Path "HKCU:\Software\Microsoft\Office\" | Where-Object {$_.Name.Contains('.0')} | ForEach-Object { $_.PSChildName }

