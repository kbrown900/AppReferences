function get-stuff{
$os = Get-CIMInstance -class Win32_operatingsystem |select Caption | findstr 'Microsoft'
$Version = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion").ReleaseId
$info = $os + " " +$version
Return ($info)
}
$x = get-stuff
$x