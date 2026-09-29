<#
.SYNOPSIS
    This PowerShell script ensures that the Windows SMB client is configured to always perform SMB packet signing.

.NOTES
    Author          : Jonathon Pfeiffer
    LinkedIn        : https://www.linkedin.com/in/jonathon-pfeiffer-912b71142/
    GitHub          :
    Date Created    : 08/31/2026
    Last Modified   :
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000100
    Documentation   : https://www.stigaview.com/products/win11/v2r8/WN11-SO-000100/

.TESTED ON
    Date(s) Tested  :
    Tested By       : Jonathon Pfeiffer
    Systems Tested  : Windows 11
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator and execute the script.

    Example:
    PS C:\> .\WN11-SO-000100.ps1
#>

# ============================================================
# STIG: WN11-SO-000100
# Requirement: SMB client must always digitally sign communications
# ============================================================

$RegistryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters"
$ValueName = "RequireSecuritySignature"
$RequiredValue = 1

# Create the registry path if it does not exist
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Require SMB client signing
New-ItemProperty `
    -Path $RegistryPath `
    -Name $ValueName `
    -PropertyType DWord `
    -Value $RequiredValue `
    -Force | Out-Null

Write-Host "WN11-SO-000100 remediation complete."
Write-Host "SMB client signing is now required."

