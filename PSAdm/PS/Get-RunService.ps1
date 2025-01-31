# Make sure to use corp\adm* to run the script

<#
.Synopsis
   Get the service from localhost or remote computer.

.DESCRIPTION
   Get the service from localhost or remote computer.

.PARAMETER CompName
   Get the service on the specified computers. The default is the local computer.

.PARAMETER Process
   Get the name of the specified service name.

.EXAMPLE
   Get-ServiceRun -CompName mp-pin-sa01, mp-pin-sw01 -Service pinnacle*
   Get the service Pinnacle* in running status on the remotre computers.

.EXAMPLE
   Get-ServiceRun -CompName mp-bts-sa01, mp-bts-sa02, mp-bts-sa03 -Service Splunk*
   Get the service Splunk in a running status on the remote computers.
#>

Function Get-ServiceRun {

   Param (

   [Parameter (   
        ValueFromPipeline=$true,
        ValueFromPipelineByPropertyName=$true   
        )
   ]
   
        [string[]] $ComputerName,
        [string[]] $Service
   )

    ForEach ($C in $ComputerName) {
        Get-Service -ComputerName $C -Name $Service |
        Where-Object Status -eq "Running" |
        Select-Object Status, Name, MachineName
        }

}

# ------------------------ Test Run ------------------------------

# Get-ServiceRun -ComputerName mp-hms-a01, mp-hms-a02, mp-hms-a03, mp-hms-a04 -Service *vws, vitalP*, CERME, Mckesson*

# Get-ServiceRun -ComputerName md-hms-a01 -Service *vws, vitalP*, Mckesson*

# Get-ServiceRun -ComputerName Baz-MPSSRS1 -Service ReportServer*RSPROD

# Get-ServiceRun -ComputerName mp-adr-d01 -Service Splunk*

# Get-ServiceRun -ComputerName mp-si0-d03, mp-sql-sd11 -Service Splunk*

# Get-ServiceRun -ComputerName mm-swd-a02 -Service solar*

# get-ServiceRun -ComputerName md-tfs-d10 -Service Gx*

# Get-serviceRun -computername mt-hms-sd02 -service msdts*, mssql*, ssistel*, sql*

# Get-ServiceRun -ComputerName md-pmm-a01 -Service master*

# Get-ServiceRun -ComputerName mp-360-a01, mp-360-a02, mp-360-a03 -Service P360PA*

# Get-ServiceRun -ComputerName mp-360-a03 -Service P360PA-BCBSPA6


