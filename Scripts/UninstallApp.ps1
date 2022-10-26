#Uninstalls a specificed application by Application Name value.
#Change "appname" to something like "Apple*" to uninstall any program with "Apple" in the name
#Change computer name to whatever computer name you need OR pull names from a text file

$name = "appname"   #Applications Name
$hostname = 'Computer01' #Computer names

#don't need to mess with this part
Get-WmiObject Win32_Product -ComputerName $hostname | Where-Object -FilterScript {$_.Name -like $name } |  foreach {if ($_.uninstall().returnvalue -eq 0) { write-host "Successfully uninstalled $($_.Name) from $($hostname)" }Else{Write-Host "$($_.Name) Failed to Uninstall from $($hostname)" }}
