# Make the window visible
#$ie.Visible = $true

# Launch PowerShell ISE and the necessary scripts
$BT_FS_Checks = "G:\OPS\Scripts\PowerShell\Biztalk Foresight\BT_FS_Checks.ps1"
$Check_MQ_Log = "G:\OPS\Scripts\PowerShell\MQ_Log\Check_MQ_Log.ps1"
$Foresight_WF_GF = "G:\OPS\Scripts\PowerShell\Biztalk Foresight\FRS_ProdStatus.ps1"
$Time_Out_Watcher = "G:\OPS\Scripts\PowerShell\Time Out Watcher\TOWatcher.ps1"
$FRS_ErrorCheck_Manual = "G:\OPS\Scripts\PowerShell\Biztalk Foresight\FRS_ErrorCheck_Manual_2.ps1"
$Recon = "G:\OPS\Scripts\PowerShell\Recon\SC_DEIS.ps1"
$IndivTUO = "G:\OPS\Scripts\PowerShell\URLs\Get-IndTUOCheck.ps1"

C:\Windows\system32\WindowsPowerShell\v1.0\PowerShell_ISE.exe "$BT_FS_Checks,$Check_MQ_Log,$Time_Out_Watcher, `
                                                               $FRS_ErrorCheck_Manual,$Recon,$Foresight_WF_GF,$IndivTUO"