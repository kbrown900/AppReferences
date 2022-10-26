function Get-Stuff {
$cpu = "CPU: " + (Get-CIMInstance win32_processor).Name
$mobo = "Motherboard Make: " + (Get-CIMInstance win32_baseboard).Manufacturer
$mobo = $mobo + "`n" +"Motherboard Model: " + (Get-CIMInstance win32_baseboard).Product
$ram = "RAM: " + (Get-CIMInstance -class Win32_PhysicalMemory | Measure-Object -Property capacity -Sum | % {[Math]::Round(($_.sum / 1GB),2)}) + "gb"
$info = $cpu + "`n" + $ram + "`n" + $mobo
Return ($info)
}
$x = get-stuff
$x