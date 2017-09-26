get-aduser username -properties passwordlastset, passwordneverexpires, | ft Name, passwordlastset, Passwordneverexpires

# for a bit more verbose output of user account properties:

get-aduser username -properties passwordlastset, AccountExpirationDate, PasswordExpired, LastBadPasswordAttempt, LockedOut, Enabled |ft Name, passwordlastset, AccountExpirationDate, PasswordExpired, LastBadPasswordAttempt, LockedOut, Enabled

# you get the point - add or subtract whatever
