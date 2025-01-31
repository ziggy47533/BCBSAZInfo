$Serv1 = "LD-EPM-A01", "LD-IVR-A01", "LD-IVR-W01"
# $Serv2 = "LU-EPM-A01", "LU-IVR-A01", "LU-IVR-W01"

function Get-LinuxPing {

    foreach ($LinuxSer in $Serv1) {

        Test-Connection -ComputerName $LinuxSer

    }

}

Get-LinuxPing
