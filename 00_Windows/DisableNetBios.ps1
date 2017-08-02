
#Disable NetBios
sc stop Lmhosts
sc config Lmhosts start= disabled
reg add HKLM\System\CurrentControlSet\Services\VxD\MSTCP -Name EnableDNS -Type String -Value 0 -Force
