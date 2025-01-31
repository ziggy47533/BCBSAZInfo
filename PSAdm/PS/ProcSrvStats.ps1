# ***************************
#
# Author: Cmitchel
#
# Date: 2-22-20
#
# **************************

Clear-Host

# Process Status:

# Get-Process -ComputerName -Name 


# Get-Process -ComputerName -Name | Stop-Process -WhatIf

# Get-Process -ComputerName -Name | Start-Process

# ---------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------

# Services Status:

# Get-Service -ComputerName md-tfs-d10 -Name Gx* 

# Get-Service -ComputerName md-tfs-d10  -Name Gx* | Restart-Service -Verbose -force

# Get-Service -ComputerName md-pmm-a01 -Name master* | Stop-Service -Verbose

# Get-Service -ComputerName md-pmm-a01 -Name master* | Restart-Service -Verbose -Force

 Get-Service -ComputerName mp-doc-sd01, mm-scs-ss12 -Name splunk* | Restart-Service -Verbose -Force


# ************ Notes ******************

# Gx* - Commvualt services ( Gxcl* )

# splunk*
