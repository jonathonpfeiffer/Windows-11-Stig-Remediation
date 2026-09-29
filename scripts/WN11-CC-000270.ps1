<#
.SYNOPSIS
    This PowerShell script ensures that passwords are not saved in the Windows Remote Desktop Client.

.NOTES
    Author          : Jonathon Pfeiffer
    LinkedIn        : https://www.linkedin.com/in/jonathon-pfeiffer-912b71142/
    GitHub          :
    Date Created    : 08/31/2026
    Last Modified   :
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000270
    Documentation   : https://www.stigaview.com/products/win11/v2r8/WN11-CC-000270/

.TESTED ON
    Date(s) Tested  :
    Tested By       : Jonathon Pfeiffer
    Systems Tested  : Windows 11
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator and execute the script.

    Example:
    PS C:\> .\WN11-CC-000270.ps1
#>

# ============================================================
# STIG: WN11-CC-000270
# Requirement: Do not allow passwords to be saved in RDP Client
# ============================================================

$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$ValueName = "DisablePasswordSaving"
$RequiredValue = 1

# Create the registry path if it does not already exist
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Prevent passwords from being saved in the RDP Client
New-ItemProperty `
    -Path $RegistryPath `
    -Name $ValueName `
    -PropertyType DWord `
    -Value $RequiredValue `
    -Force | Out-Null

Write-Host "WN11-CC-000270 remediation complete."
Write-Host "Remote Desktop Client password saving has been disabled."




