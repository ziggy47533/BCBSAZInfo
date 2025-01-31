# Make sure to use corp\adm* to run the script

Clear-Host

# Stop all pinnacle services
Get-Service pinnacle* -ComputerName mp-pin-sa01, mp-pin-sw01 |
where {$_.Status -eq "Running"} |
Stop-Service -PassThru

Start-Sleep -Seconds 30

# Restart all the pinnacle servies
Get-Service pinnacle* -ComputerName mp-pin-sa01, mp-pin-sw01 |
where {$_.Status -eq "Stopped"} |
Restart-Service -PassThru
