# Restart IIS from a Remote Server(s)

Invoke-Command -ComputerName "xxxxx" -scriptblock { iisreset /STOP}

Invoke-Command -ComputerName "xxxxx" -scriptblock { iisreset /Start}
