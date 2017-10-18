Import-Module ActiveDirectory

$search='OU=your,DC=domain,DC=specific,DC=path'

$property=@(
   'Name',
   'samAccountName',
   'Description',
   'Enabled',
   @{n="MemberOf";e={($_.memberof | %{(Get-ADGroup $_).samAccountName}) -join ";"}}
)

Get-ADUser -filter * -Properties * -SearchBase 'OU=your,DC=domain,DC=specific,DC=path' | select $property | export-Csv -LiteralPath "$home\Desktop\userGroups.csv"
