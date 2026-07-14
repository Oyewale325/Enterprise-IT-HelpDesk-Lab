Write-Host "===== NETWORK DIAGNOSTICS ====="

Write-Host "`nIP Configuration:"
ipconfig

Write-Host "`nTesting Connectivity to Server:"
Test-Connection 192.168.10.10 -Count 2

Write-Host "`nTesting DNS Resolution:"
nslookup techsolutions.local