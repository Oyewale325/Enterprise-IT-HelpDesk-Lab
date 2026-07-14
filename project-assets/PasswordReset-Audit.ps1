Import-Module ActiveDirectory

# Log folder and file
$LogFolder = "C:\PowerShell-Scripts"
$LogFile = "$LogFolder\PasswordResetLog.txt"

# Create log folder if it does not exist
if (!(Test-Path $LogFolder))
{
    New-Item `
        -Path $LogFolder `
        -ItemType Directory `
        -Force | Out-Null
}

# Administrator running script
$AdminUser = $env:USERNAME

# Get username
$username = Read-Host "Enter username"

try {

    # Retrieve user
    $user = Get-ADUser `
        -Identity $username `
        -Properties PasswordNeverExpires

    # Generate random password
    Add-Type -AssemblyName System.Web

    $tempPassword = `
        [System.Web.Security.Membership]::GeneratePassword(12,3)

    $securePassword = ConvertTo-SecureString `
        $tempPassword `
        -AsPlainText `
        -Force

    # Reset password
    Set-ADAccountPassword `
        -Identity $username `
        -NewPassword $securePassword `
        -Reset

    # Unlock account if locked
    Unlock-ADAccount `
        -Identity $username `
        -ErrorAction SilentlyContinue

    # Disable Password Never Expires if enabled
    if ($user.PasswordNeverExpires)
    {
        Set-ADUser `
            -Identity $username `
            -PasswordNeverExpires $false
    }

    # Force password change at next logon
    Set-ADUser `
        -Identity $username `
        -ChangePasswordAtLogon $true

    # Timestamp
    $DateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    # Log success
    Add-Content `
        -Path $LogFile `
        -Value "$DateTime | SUCCESS | Admin=$AdminUser | User=$username"

    # Display results
    Write-Host ""
    Write-Host "==================================="
    Write-Host "PASSWORD RESET SUCCESSFUL"
    Write-Host "==================================="
    Write-Host "Username: $username"
    Write-Host "Temporary Password: $tempPassword"
    Write-Host "Password Change Required: Yes"
}
catch {

    $DateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    # Log failure
    Add-Content `
        -Path $LogFile `
        -Value "$DateTime | FAILED | Admin=$AdminUser | User=$username | Error=$($_.Exception.Message)"

    Write-Host ""
    Write-Host "Password reset failed."
    Write-Host $_.Exception.Message
}