# Calc the monthly score 


[double] $Tot_Min_Down = Read-Host "Enter the minutes: "

[double] $Calc_Month_Mins = Read-Host "Enter the monthly minutes: "



# Results:

[double] $Pct_Calc = ($Tot_Min_Down / $Calc_Month_Mins) * 100

[double] $Pct_Avail = 100 - (($Tot_Min_Down / $Calc_Month_Mins) * 100)

Write-Host ("The % is {0} and the % Available is {1} " -f $Pct_Calc, $PCt_Avail) 
