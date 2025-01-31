# Active Directories Information about User Accounts.

Clear-Host

# help get-ADPrincipalGroupMembership -full | out-file C:\test\ADGRPMEM.txt

#get-ADPrincipalGroupMembership cmitchel | select-object Name, GroupCategory, GroupScope | Sort-Object Name |  ft -AutoSize | out-file C:\Test\ADGrpMem.txt

# -----------------------------------------------------------------------------------------------------------------------------


# Find the user account membership too:
get-ADPrincipalGroupMembership cmitchel | select-object Name, GroupCategory, GroupScope | Sort-Object Name |  ft -AutoSize
(get-ADPrincipalGroupMembership cmitchel | select name).count
