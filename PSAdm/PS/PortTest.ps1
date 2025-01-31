# Test port connection for servers......

Function Get-PortTest {

Param (

[String[]] $ComputerName,

[int32[]] $Port

)

Test-NetConnection -ComputerName $ComputerName -Port $Port

}

# ----- test -----

# Test-NetConnection -ComputerName d1pa -Port 6001

# Test-NetConnection -ComputerName d1pa -Port 6003

# Get-PortTest -ComputerName d1pa -Port 6001

# Get-PortTest -ComputerName d1pa -Port 6003
