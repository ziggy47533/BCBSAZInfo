clear-host

#date: 8-29-21
#sciprt location: \\baz-filer02\micro\OPS\Website\Dashboard_msedge.ps1

$Browser="msedge.exe"

Start-Process $Browser "http://10.10.40.51/sign-in" #kanban board
Start-Sleep -Seconds 1
Start-Process $Browser "www.yammer.com" #yammer. group/chat turnover
Start-Sleep -Seconds 1
Start-Process $Browser "\\baz-filer02\micro\OPS\Website\index.html" #old turnover
Start-Sleep -Seconds 1
#Start-Process $Browser "https://tech.azblue.com/infrastructure/opg/Lists/Turnover/Grouped.aspx" # New Turnover
Start-Process $Browser "https://azblue365.sharepoint.com/sites/tech/infrastructure/opg/Lists/Turnover/Grouped.aspx?viewpath=%2Fsites%2Ftech%2Finfrastructure%2Fopg%2FLists%2FTurnover%2FGrouped.aspx" # New Turnover
Start-Sleep -Seconds 1
#Start-Process $Browser "http://tech.azblue.com/Pages/WebThroughput.aspx" # provider portal t-logs
Start-Process $Browser "https://azblue365.sharepoint.com/sites/tech/Pages/WebThroughput.aspx" # provider portal t-logs
Start-Sleep -Seconds 1
Start-Process $Browser "https://bcbsareporting.bcbs.com/prodreports/bi/" # BX close-out report
Start-Sleep -Seconds 1
Start-Process $Browser "http://10.1.76.199/Orion/SummaryView.aspx?viewname=Current%20Top%2010%20Lists" # solarwinds
Start-Sleep -Seconds 1
Start-Process $Browser "\\baz-filer02\micro\OPS\Website\Virtual_Dashboard.htm" # vcenters / vrops
Start-Sleep -Seconds 1
Start-Process $Browser '"\\baz-filer02\micro\OPS\Documentation\5010\Foresight\Foresight Production Directory Monitoring.htm"' # FRS schedule
Start-Sleep -Seconds 1
Start-Process $Browser "http://mm-bts-sa01.corp.net.bcbsaz.com/biztalk360" # biztalk 360 dashboard
Start-Sleep -Seconds 1
Start-Process $Browser "\\baz-filer02\micro\OPS\Website\Splunk_Dashboard.htm" #splunk dashboard
Start-Sleep -Seconds 1
Start-Process $Browser "https://extrahop.bcbsaz.com/extrahop/" #extrahop #  https://extrahop.bcbsaz.com/extrahop/#/Summary/network
Start-Sleep -Seconds 1
Start-Process $Browser "http://mp-si0-a06.corp.net.bcbsaz.com:11600/filegateway/home.do" #SI5
Start-Sleep -Seconds 1
Start-Process $Browser "\\baz-filer02\micro\OPS\Documentation\5010\SI5\SI_web_dashboard\SI5_Main.htm" #SI5 dashboard
Start-Sleep -Seconds 1
Start-Process $Browser "https://bcbsaz.service-now.com/" #Serving Now
Start-Sleep -Seconds 1
Start-Process $Browser "\\baz-filer02\micro\OPS\Website\On-Call\0MasterOnCall.htm"
Start-Sleep -Seconds 1


# Launch PowerShell ISE and the necessary scripts
$BT_FS_Checks = "G:\OPS\Scripts\PowerShell\Biztalk Foresight\BT_FS_Checks.ps1"
#$Check_MQ_Log = "G:\OPS\Scripts\PowerShell\MQ_Log\Check_MQ_Log.ps1"  ##no more. MQ  has been updated on3-8-20. use splunk dashboard
$FRS_ErrorCheck_Manual = "G:\OPS\Scripts\PowerShell\Biztalk Foresight\FRS_ErrorCheck_Manual_2.ps1"
$Recon1 = "G:\OPS\Scripts\PowerShell\Recon\SC_DEIS.ps1"
$FRS_Check_Status = "G:\OPS\Scripts\PowerShell\Biztalk Foresight\FRS_ProdStatus.ps1"
$DirectoryChecks = "G:\OPS\Documentation\2_OperationsShiftTasks\2_SecondShift\Powershell\DirectoryCheck.ps1"
$TUO_Check = "G:\OPS\Documentation\2_OperationsShiftTasks\2_SecondShift\Powershell\TUO_web_check.ps1"
$Evi_Core = "G:\OPS\Documentation\2_OperationsShiftTasks\2_SecondShift\Powershell\eviCore.ps1"
$Disk_Space_Check = "G:\OPS\Documentation\2_OperationsShiftTasks\2_SecondShift\Powershell\DiskSpace\DiskSpace_Main_Menu.ps1"
$Website_Availability = "G:\OPS\Documentation\2_OperationsShiftTasks\2_SecondShift\Powershell\DOC1_web_check.ps1"
#$Service_RSPROD = "G:\OPS\Documentation\2_OperationsShiftTasks\2_SecondShift\Powershell\Service_RSPROD.ps1"

C:\Windows\system32\WindowsPowerShell\v1.0\PowerShell_ISE.exe "$BT_FS_Checks,$Time_Out_Watcher,$FRS_ErrorCheck_Manual,$Recon1,$FRS_Check_Status,$TUO_Check,$DirectoryChecks,$Evi_Core,$Disk_Space_Check,$Website_Availability,$Service_RSPROD"


##clear-host
## Launch Commvault
$dir = cd "C:\Program Files\CommVault\Simpana2\GUI"
$dir1 = cd "C:\Program Files\CommVault\Simpana\GUI"
$dir2 = cd "C:\Program Files\CommVault\ContentStore2\GUI"
$dir3 = cd "C:\Program Files\CommVault\ContentStore\GUI" ##Rodney got new Win10 laptop, install CMV to directory on 4-2-19

If (($dir = $true) -or ($dir1 = $true) -or ($dir2 = $true) -or ($dir3 = $true))
  {Start-Process "javaw.exe" "-jar cv.jar commserve.corp.net.bcbsaz.com 8401 -oemid=1"}

##clear-host



## Launch SCOM
Start-Sleep -Seconds 35
Start-Process "C:\Program Files\Microsoft System Center 2016\Operations Manager\Console\Microsoft.EnterpriseManagement.Monitoring.Console.exe"

clear-host