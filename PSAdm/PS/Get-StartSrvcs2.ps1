# Start a service

Function Get-StartSrvcs {

 Param (

   [Parameter (   
        ValueFromPipeline=$true,
        ValueFromPipelineByPropertyName=$true   
        )
   ]
   
        [string[]] $ComputerName
        
   )

 Invoke-Command -ComputerName $ComputerName -ScriptBlock {

    if (( Get-Service -Name splunk* ).Status -ne "Running" ) {
          Start-Service -Name Splunk*
        }

    else { Write-Host "Server $ComputerName is running" }

    }
}

# ----------------- Test ---------------------------------------

# Get-StartSrvcs -ComputerName mp-doc-sd01