# Rest IIS on multiple servers

# invoke-command -computername "TARGET-HOST" -scriptblock {iisreset /STOP}

# invoke-command -computername "TARGET-HOST" -scriptblock {iisreset /START}

# invoke-command -computername "TARGET-HOST" -scriptblock {iisreset /RESTART}

# -------------------------------------------------------------------------------------

# $Cred = "corp\admcmitchel"

# Invoke-Command -ComputerName "mp-prx-w01" -ScriptBlock {issreset /restart} -Credential $cred

# Invoke-Command -ComputerName "mp-bts-sa03" -ScriptBlock {issreset /restart} -Credential $cred
