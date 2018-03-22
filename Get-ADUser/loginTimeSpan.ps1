foreach ($User in Get-ADUser -Filter * -Properties * -SearchBase 'OU=you,OU=domain,DC=specific,DC=orgunit,DC=site')
{   
    $TimeSpan = "{00:dd\:hh\:mm\:ss}" -f ([timespan]::fromticks($User.'lastLogon' - $User.'msDS-LastFailedInteractiveLogonTime'))
    $LastFailedLogon= [datetime]::FromFileTime($User.'msDS-LastFailedInteractiveLogonTime')
    $LastSuccessfulLogon= [datetime]::FromFileTime($User.'msDS-LastSuccessfulInteractiveLogonTime')   
    @{"User" = $User.Name; "Last failed logon" = $LastFailedLogon; "Last successfull logon" = $LastSuccessfulLogon; "Time span" = $TimeSpan }.GetEnumerator() | Sort -Descending -Property Name | Format-Table
} 
