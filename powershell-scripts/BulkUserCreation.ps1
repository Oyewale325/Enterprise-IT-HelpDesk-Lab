Import-Module ActiveDirectory

$Users = @(
    @{First="James";Last="Smith";User="james.smith"},
    @{First="Linda";Last="Brown";User="linda.brown"},
    @{First="Michael";Last="Johnson";User="michael.johnson"}
)

foreach ($User in $Users) {

    $Password = ConvertTo-SecureString "Welcome@2026" -AsPlainText -Force

    New-ADUser `
    -Name "$($User.First) $($User.Last)" `
    -GivenName $User.First `
    -Surname $User.Last `
    -SamAccountName $User.User `
    -UserPrincipalName "$($User.User)@techsolutions.local" `
    -AccountPassword $Password `
    -Enabled $true `
    -Path "OU=Users,OU=TechSolutions,DC=techsolutions,DC=local"

    Write-Host "Created user: $($User.User)"
}