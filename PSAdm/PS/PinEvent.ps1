$ServerName = get-content -Path C:\PSAdm\RemoteEvent\PinSrvrs.txt

foreach ($Server in $ServerName) {
    Get-WinEvent -ComputerName $Server -MaxEvents 20 -credential corp\pinweb-svc -FilterHashtable @{
        LogName = "Application"
        Level   = 1, 2 # 1 critical 2 Error
    } | Select-Object TimeCreated, Id, Level, @{Name = "ComputerName"; expression = { $Server } }, Message |
        Format-Table -AutoSize -Wrap
}
