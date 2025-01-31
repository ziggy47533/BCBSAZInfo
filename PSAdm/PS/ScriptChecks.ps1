# Run multiple scripts at the same time....

# Make the window visible
# $ie.Visible = $true

# Launch PowerShell ISE and the necessary scripts

$Java = "C:\PSAdm\GPSJava.ps1"
$PinSrvs = "C:\PSAdm\PinnSrvs.ps1"
$Process = "C:\PSAdm\Get-ProcessRun.ps1"
$StopService = "C:\PSAdm\Get-StopService.ps1"
$RunService = "C:\PSAdm\Get-RunService.ps1"
$ProcSrvStat = "C:\PSAdm\ProcSrvStats.ps1"
$ADInfo = "C:\PSAdm\ADInfo.ps1"
$ADMemInfo = "C:\PSAdm\ADMemInfo.ps1"
$Linux = "C:\PSAdm\Get-LinuxPing.ps1"
$IIS = "C:\PSAdm\Get-RemoteIIS.ps1"
$G360 = "C:\PSAdm\svcRestart360.ps1"
$SQLRestart = "C:\PSAdm\DBRestart.ps1"

C:\Windows\system32\WindowsPowerShell\v1.0\PowerShell_ISE.exe "$Java, $PinSrvs, $Process, $StopService, $RunService, $ProcSrvStat, $ADInfo, $ADMemInfo, $Linux, $IIS, $G360, $SQLRestart"
                                                               