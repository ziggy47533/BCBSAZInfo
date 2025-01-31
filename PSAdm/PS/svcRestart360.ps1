Clear-Host

### Service Reset ##########################                       
### Purpose: Locked Process By Agents ##
### Author: James Brewer #################
### Created: 4/19/2023 ###################


$server1 = "mp-360-a01"
$server2 = "mp-360-a02"
$server3 = "mp-360-a03"

#Restarting service on mp-360-a01
$svcRestart1 = (Get-Service -ComputerName $server1 -DisplayName *BCBSPA*, *WFSERVE* | Restart-Service)
$svcRestart1
Start-Sleep -Seconds 30

#Checking Status of services
Write-Host "Restarting services on MP-360-A01" -ForegroundColor DarkYellow
$svcStatus1 = (Get-Service -ComputerName $server1 -DisplayName *BCBSPA*, *WFSERVE*).Status
$svcStatus1.Status
if ($svcStatus1 -ne "Running") {
    Write-Host "All services not started, view the server and start them manually." -ForegroundColor Red
    } else { Write-Host "Services have started successfully on MP-360-A01" -ForegroundColor Green } 

""

#Restarting service on mp-360-a02
$svcRestart = (Get-Service -ComputerName $server2 -DisplayName *BCBSPA*, *WFSERVE* | Restart-Service)
$svcRestart
Start-Sleep -Seconds 30

#Checking Status of services
Write-Host "Restarting services on MP-360-A02" -ForegroundColor DarkYellow
$svcStatus2 = (Get-Service -ComputerName $server2 -DisplayName *BCBSPA*, *WFSERVE*).Status
$svcStatus2.Status
if ($svcStatus2 -ne "Running") {
    Write-Host "All services not started, view the server and start them manually." -ForegroundColor Red
    } else { Write-Host "Services have started successfully on MP-360-A02" -ForegroundColor Green }

""

#Restarting service on mp-360-a03
$svcRestart3 = (Get-Service -ComputerName $server1 -DisplayName *BCBSPA*, *WFSERVE* | Restart-Service)
$svcRestart3
Start-Sleep -Seconds 30

#Checking Status of services
Write-Host "Restarting services on MP-360-A03" -ForegroundColor DarkYellow
$svcStatus3 = (Get-Service -ComputerName $server3 -DisplayName *BCBSPA*, *WFSERVE*).Status
$svcStatus3.Status
if ($svcStatus3 -ne "Running") {
    Write-Host "All services not started, view the server and start them manually." -ForegroundColor Red
    } else { Write-Host "Services have started successfully on MP-360-A03" -ForegroundColor Green }

    ""
