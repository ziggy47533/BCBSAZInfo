# Active Directories Information about Member Group

Clear-Host

# Find the Group Member for a user account:
write-host "------------------------------------------" -ForegroundColor Yellow
(Get-ADGroupMember -Identity "SVC_CMSService" -Recursive | Where objectclass -eq 'user').count
Get-ADGroupMember -Identity "SVC_CMSService" -Recursive | Where objectclass -eq 'user' |
Get-ADUser -Properties Displayname,Title,Department |
Select DistinguishedName,samAccountName,Name,Displayname,Title,Department |
sort DisplayName | ft -AutoSize
