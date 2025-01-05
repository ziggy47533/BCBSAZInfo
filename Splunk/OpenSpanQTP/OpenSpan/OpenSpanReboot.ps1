# ************************************
# Title: OpenSpan Servers Reboot    *
# Author: Chris M                    *
# Date: 1-22-18                      *
# ************************************

Function Get-OSReboot
{

 <#
      .SYNOPSIS
    The synopsis goes here. This can be one line, or many.

    .DESCRIPTION
    The description is usually a longer, more detailed explanation of what the script or function does. Take as many lines as you need.

    .PARAMETER computername
    Here, the dotted keyword is followed by a single parameter name. Don't precede that with a hyphen. The following lines describe the purpose of the parameter:

    .PARAMETER filePath
    Provide a PARAMETER section for each parameter that your script or function accepts.

    .EXAMPLE
    There's no need to number your examples.

    .EXAMPLE
    PowerShell will number them for you when it displays your help text to a user.
#>

    $Servers = Get-Content C:\Coding\PShell\Docs\OpenSpan.txt
    $Cred = Import-Clixml "C:\Coding\PShell\Docs\OpenSpan.xml"

    foreach($Server in $Servers)
    {

    (GWMI -Class Win32_OperatingSystem -ComputerName $Server -Credential $Cred).Win32Shutdown(6)
    Start-Sleep -Seconds 200 #3 mins
      If ($?)
       {
         Write-Host "$Server successfully rebooted"
       }
      Else
       {
         Write-Host "Could not reboot $Server"
       }

    }
}

Get-OSReboot