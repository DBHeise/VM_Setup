# Disable SSDP
sc stop SSDPSRV
sc config SSDPSRV start= disabled