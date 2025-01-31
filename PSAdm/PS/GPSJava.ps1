# run this PS in admin

do
{
    write-host "MP-FRS-A02"
    Get-Process -Name java -ComputerName MP-FRS-A02
 
    write-host "MP-FRS-A04"
    Get-Process -Name java -ComputerName MP-FRS-A04
 
    write-host "MP-FRS-A06"
    Get-Process -Name java -ComputerName MP-FRS-A06
 
    sleep 5
 
}

while ($true)