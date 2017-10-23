$DaysInactive = (Get-Date).AddDays(-90)
$search= 'OU=domain,DC=specific,DC=distinguished,DC=name'

$property=@(
       'Name',
       'samAccountName',
       'Description',
       'Enabled',
       #@{n="MemberOf";e={($_.memberof | %{(Get-ADGroup $_).samAccountName}) -join ";"}}
       @{n='ParentContainer';e={$_.distinguishedname -replace '^.+?,(CN|OU.+)','$1'}} )
       @{Name = "ParentContainer"; Expression = {$Object = $_.DistinguishedName; $POS = $Object.IndexOf(",OU"); $Object.Substring($pos+1)    }}

Get-ADUser -filter {(LastLogondate -lt $DaysInactive) -and (Enabled -eq $true)} -Properties * -SearchBase 'OU=INI Users,DC=ini,DC=usc,DC=edu' |   
select $property | 
export-Csv -LiteralPath "$home\Desktop\over90_UserParent.csv" 
