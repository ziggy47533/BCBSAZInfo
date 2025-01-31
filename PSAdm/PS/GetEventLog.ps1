# Get evnet log from remote machine(s)

$RemoteComps = Get-Content -Path C:\PSAdm\RemoteEvent\PinSrvrs.txt

foreach ($Server in $RemoteComps) {
    Get-WinEvent -ComputerName $Server -Credential pinweb-svc -MaxEvents 5 `
    -FilterHashtable @{
        Logname = "application"
        level   = 1, 2 # 1 Critical 2 Error
    } | Select-Object -Property machine, Id   
    
}
