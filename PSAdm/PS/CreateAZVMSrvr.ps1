new-azvm `
    -ResourceGroupName "PSWinVM" `
    -Name "PSWin" `
    -image "Win2019Datacenter" `
    -PublicIpAddressName "PSIPAddress" `
    -SubnetName "PSSubnet" `
    -OpenPorts 3389 `
    -Location "WestUS"
