#Update Group Policy on remote computers

#change $x to the list of computers desired, or save location of a text file with the computer names.
#Change $msg to desired message to send for updating (only needs to be set once)

$x = "Computer01" #gets computer names

foreach ($computer in $x) {
Write-Host $computer

#message to be sent. Change to Read-Host to have script ask for message every time it runs.
$msg = "Do NOT touch! PC will restart soon!" #Read-Host

#sending of message
Invoke-WMiMethod -Path Win32_Process -Name Create -ArgumentList "msg * $msg" -ComputerName $computer

#updates group policy, then restarts computer
Invoke-Command -cn $computer {gpupdate /force}
Restart-Computer -cn $computer -force
    }
