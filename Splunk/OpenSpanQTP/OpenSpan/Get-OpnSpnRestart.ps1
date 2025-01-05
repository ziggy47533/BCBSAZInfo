

# Shutdown OpenSpan Computers

# $CompRestart = Restart-Computer (Get-Content C:\Test\CompName.txt) -Credential "corp\opieprod01"

# $CompRestart


Function Get-OpenSpanRestart {

$computers = Get-Content C:\Test\OpenSpan.txt

foreach ($computer in $computers)

    {

        Restart-Computer -ComputerName $computer -Wait -For Wmi -Timeout 300 -ErrorVariable status

        if ($status.fullyqualifiederrorid -like "*Failed*")

        {

            # Put your failed email message here

            Write-Host "$computer did not reboot"

            Send-MailMessage -To chris.Mitchell@azlue.com -From xx@xxx.com -Subject "Reboot script failed at $(Get-Date)" -building '$computer did not reboot' -SmtpServer appmail.azblue.com

        }

        else

        {

            # Put your passed email message here

            Write-Host "$computer rebooted"

            Send-MailMessage -To chris.mitchell@azblue.com -From x@x.com -Subject "Reboot script succeeded at $(Get-Date)" -building "Reboot script succeeded at $(Get-Date)" -SmtpServer appmail.azblue.com

        }

     }

 }