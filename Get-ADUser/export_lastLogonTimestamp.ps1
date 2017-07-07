# This CmdLet selects a spcific Organizational Unit and outputs each users Last Logon Date
# If they have never logged in, the date will show up as 12/31/1600 4:00:00 PM

# Your SearchBase might be different, but this one matches an OU in an OU at a name@**dept.school.edu**
# The best way to get the exact SearchBase is OU Properties > Attribute Editor > Dbl-Clk and Copy distinguishedName

# You can also edit output to whatever directory and change file type.
# If you just want to view, swap out the 'Export-CSV' bit with 'Out-GridView'


PS C:\Windows\system32> Get-ADUser -Filter * -SearchBase "OU=org_unit,OU=org_unit,DC=domain,DC=domain,DC=domain" -ResultPageSize 0 -Prop CN, lastLogonTimestamp | Select CN,@{n="lastLogonDate";e={[datetime]::FromFileTime($_.lastLogonTimestamp)}} | Export-CSV -NoType -LiteralPath "$home\Desktop\filename.csv"
