# Make sure to use corp\adm* to run the script

<#
.Synopsis
   Get the process from localhost or remote computer.

.DESCRIPTION
   Get process from localhost or remote computer.

.PARAMETER CompName
   Get the process on the specified computers. The default is the local computer.

.PARAMETER Process
   Get the name of the specified process name.

.EXAMPLE
   Get-ProcessRun -CompName mp-frs-a02, mp-frs-a04, mp-frs-a06 -Process java
   Get the process Java on the remote computers.

.EXAMPLE
   Get-ProcessRun -CompName mp-frs-a03 -Process java
#>

Function Get-ProcessRun {

   Param (

   [Parameter (   
        ValueFromPipeline=$true,
        ValueFromPipelineByPropertyName=$true   
        )
   ]

        [string[]] $ComputerName,
        [string[]] $Process
   )

    ForEach ($C in $ComputerName) {
        Get-Process -ComputerName $C -Name $Process |
        Select-Object Handles, NPM, PM, WS, CPU, Id, ProcessName, MachineName |
        Format-Table -AutoSize
        
        }

}

# ------------------------ Test Run ------------------------------

# Get-ProcessRun -ComputerName mp-abs-sa05, mp-abs-sa06 -Process excel, msaccess

# Get-ProcessRun -ComputerName mp-frs-a02, mp-frs-a04, mp-frs-a06 -Process java

# Get-ProcessRun -ComputerName mp-frs-a03 -Process java


