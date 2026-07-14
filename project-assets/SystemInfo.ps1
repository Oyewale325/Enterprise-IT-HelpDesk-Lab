Write-Host "===== SYSTEM INFORMATION ====="

$Computer = hostname
$OS = (Get-CimInstance Win32_OperatingSystem).Caption
$RAM = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory /1GB,2)
$CPU = (Get-CimInstance Win32_Processor).Name
$IP = (Get-NetIPAddress -AddressFamily IPv4 |
Where-Object {$_.IPAddress -notlike '127.*'}).IPAddress

Write-Host "Computer Name: $Computer"
Write-Host "Operating System: $OS"
Write-Host "RAM: $RAM GB"
Write-Host "Processor: $CPU"
Write-Host "IP Address: $IP"