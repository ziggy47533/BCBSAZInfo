# Check if the port is open

Clear-Host

# Give a serve name
# $ServerName = "mm-ops-a01"
# $ServerName = "mp-bts-ss02"
# $ServerName = "mp-frs-a01"
# $ServerName = "mp-frs-a08"
  

# Give a port number
$Port = 445

$Connection = New-Object System.Net.Sockets.TcpClient($ServerName, $Port)
if ($Connection.Connected) {
    Write-Host "The port $port is open - Success on $ServerName"
   }

else {
    Write-Host "the port $port is closed - Failed on $ServerName"

}
