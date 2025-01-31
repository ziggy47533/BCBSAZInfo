clear-host

## Created on 11-27-17
## Script location: G:\OPS\Documentation\2_OperationsShiftTasks\2_SecondShift\Powershell\RebootMPIR.ps1

$Username = Read-Host -Prompt "Enter Username" #CORP\admrshorty
  $SecurePassword = Read-Host -Prompt "Enter password" -AsSecureString | convertfrom-securestring | out-file "\\baz-filer02\MICRO\OPS\Scripts\PowerShell\Secure\Securestring.txt"
  $Password = cat "\\baz-filer02\MICRO\OPS\Scripts\PowerShell\Secure\Securestring.txt" | ConvertTo-SecureString
  $credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Username, $Password

## Initial time stamp
$Fdate=get-date -Format G

## Reboots Image Retriever servers one at at time with 5 minute intervals
(gwmi win32_operatingsystem -ComputerName baz-mpir20v -cred $credential).Win32Shutdown(6)

clear-host
$Fdate
Write-host "`nRebooting baz-mpir20v  (1 of 9)" -ForegroundColor Yellow
start-sleep -Seconds 300
clear-host

(gwmi win32_operatingsystem -ComputerName baz-mpir21v -cred $credential).Win32Shutdown(6)

clear-host
$Fdate
Write-host "`nRebooting baz-mpir21v  (2 of 9)" -ForegroundColor Yellow
start-sleep -Seconds 300
clear-host

(gwmi win32_operatingsystem -ComputerName baz-mpir22v -cred $credential).Win32Shutdown(6)

clear-host
$Fdate
Write-host "`nRebooting baz-mpir22v  (3 of 9)" -ForegroundColor Yellow
start-sleep -Seconds 300
clear-host

(gwmi win32_operatingsystem -ComputerName baz-mpir23v -cred $credential).Win32Shutdown(6)

clear-host
$Fdate
Write-host "`nRebooting baz-mpir23v  (4 of 9)" -ForegroundColor Yellow
start-sleep -Seconds 300
clear-host

(gwmi win32_operatingsystem -ComputerName baz-mpir24v -cred $credential).Win32Shutdown(6)

clear-host
$Fdate
Write-host "`nRebooting baz-mpir24v  (5 of 9)" -ForegroundColor Yellow
start-sleep -Seconds 300
clear-host

(gwmi win32_operatingsystem -ComputerName baz-mpir25v -cred $credential).Win32Shutdown(6)

clear-host
$Fdate
Write-host "`nRebooting baz-mpir25v  (6 of 9)" -ForegroundColor Yellow
start-sleep -Seconds 300
clear-host

(gwmi win32_operatingsystem -ComputerName baz-mpir26v -cred $credential).Win32Shutdown(6)

clear-host
$Fdate
Write-host "`nRebooting baz-mpir26v  (7 of 9)" -ForegroundColor Yellow
start-sleep -Seconds 300
clear-host

(gwmi win32_operatingsystem -ComputerName baz-mpir27v -cred $credential).Win32Shutdown(6)

clear-host
$Fdate
Write-host "`nRebooting baz-mpir27v  (8 of 9)" -ForegroundColor Yellow
start-sleep -Seconds 300
clear-host

(gwmi win32_operatingsystem -ComputerName baz-mpir28v -cred $credential).Win32Shutdown(6)

clear-host
$Fdate
Write-host "`nRebooting baz-mpir28v  (9 of 9)" -ForegroundColor Yellow
start-sleep -Seconds 300
clear-host


write-host "`nStarted - $Fdate"

Write-host "`nAll done rebooting Image Retriever servers`n" -ForegroundColor Green

$Edate=get-date -Format G
write-host "Ended - $Edate`n"

start-sleep -Seconds 180

## After reboot, check to make sure servers are up and running
$Servers = "baz-mpir20v","baz-mpir21v","baz-mpir22v","baz-mpir23v","baz-mpir24v","baz-mpir25v","baz-mpir26v","baz-mpir27v","baz-mpir28v"

## Ping servers
write-Host "`nPinging Image Retriever Servers:`n" -ForegroundColor cyan
foreach ($Server in $Servers)
 { 
  if (test-connection -ComputerName $Server -Count 2 -Quiet)
    {
      
      write-Host "  $Server is alive and Pinging " -ForegroundColor Green
    }
  else
    {
      Write-host "  WARNING! $Server is NOT pinging" -ForegroundColor red
    }
} 

write-Host "" ## Space needed

## Check IIS service running
write-Host "`nIIS service is up and running:`n" -ForegroundColor cyan
foreach($Server in $Servers)
 {
   $iis = get-wmiobject Win32_Service -ComputerName $Server -cred $credential -Filter "name='IISADMIN'"

   if($iis.State -eq "Running")
     {
       Write-Host "  IIS is running on $Server" -ForegroundColor Green
     }
   else
     {
       Write-Host "  IIS is not running on $Server" -ForegroundColor red
     }
 }