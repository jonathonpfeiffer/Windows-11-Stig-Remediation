<#
.SYNOPSIS
    This PowerShell script ensures that the LanMan authentication level is configured to send NTLMv2 responses only and refuse LM and NTLM.

.NOTES
    Author          : Jonathon Pfeiffer
    LinkedIn        : https://www.linkedin.com/in/jonathon-pfeiffer-912b71142/
    GitHub          :
    Date Created    : 08/31/2026
    Last Modified   :
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000205
    Documentation   : https://www.stigaview.com/products/win11/v2r8/WN11-SO-000205/

.TESTED ON
    Date(s) Tested  :
    Tested By       : Jonathon Pfeiffer
    Systems Tested  : Windows 11
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator and execute the script.

    Example:
    PS C:\> .\WN11-SO-000205.ps1
#>

# ============================================================
# STIG: WN11-SO-000205
# Requirement: Send NTLMv2 responses only and refuse LM/NTLM
# ============================================================

$RegistryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
$ValueName = "LmCompatibilityLevel"
$RequiredValue = 5

# Ensure the registry path exists
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Configure LAN Manager authentication level
New-ItemProperty `
    -Path $RegistryPath `
    -Name $ValueName `
    -PropertyType DWord `
    -Value $RequiredValue `
    -Force | Out-Null

Write-Host "WN11-SO-000205 remediation complete."
Write-Host "LAN Manager authentication level set to NTLMv2 only; LM and NTLM refused."



