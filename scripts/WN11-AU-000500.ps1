<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows
    Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Jonathon Pfeiffer
    LinkedIn        : https://www.linkedin.com/in/jonathon-pfeiffer-912b71142/
    GitHub          : 
    Date Created    : 08/31/2026
    Last Modified   : 08/31/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-AU-000500/

.TESTED ON
    Date(s) Tested  : 08/31/2026
    Tested By       : Jonathon Pfeiffer
    Systems Tested  : Windows 11
    PowerShell Ver. : 

.USAGE
    Run PowerShell as Administrator.

    Example:
    PS C:\> .\WN11-AU-000500.ps1
#>

# ============================================================
# STIG: WN11-AU-000500
# Requirement: Application Event Log >= 32768 KB
# ============================================================

$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$ValueName = "MaxSize"
$RequiredSize = 32768

# Create the registry path if it does not already exist
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Configure the Application Event Log maximum size
New-ItemProperty `
    -Path $RegistryPath `
    -Name $ValueName `
    -PropertyType DWord `
    -Value $RequiredSize `
    -Force | Out-Null

Write-Host "WN11-AU-000500 remediation complete."
Write-Host "Application Event Log MaxSize set to 32768 KB."




