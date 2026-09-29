<#
.SYNOPSIS
    This PowerShell script ensures that PowerShell Script Block Logging is enabled on Windows 11.

.NOTES
    Author          : Jonathon Pfeiffer
    LinkedIn        : https://www.linkedin.com/in/jonathon-pfeiffer-912b71142/
    GitHub          :
    Date Created    : 08/31/2026
    Last Modified   :
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000326
    Documentation   : https://www.stigaview.com/products/win11/v2r8/WN11-CC-000326/

.TESTED ON
    Date(s) Tested  :
    Tested By       : Jonathon Pfeiffer
    Systems Tested  : Windows 11
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator and execute the script.

    Example:
    PS C:\> .\WN11-CC-000326.ps1
#>

# YOUR REMEDIATION CODE GOES HERE# ============================================================
# STIG: WN11-CC-000326
# Requirement: PowerShell Script Block Logging must be enabled
# ============================================================

$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
$ValueName = "EnableScriptBlockLogging"
$RequiredValue = 1

# Create the registry path if it does not already exist
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Enable PowerShell Script Block Logging
New-ItemProperty `
    -Path $RegistryPath `
    -Name $ValueName `
    -PropertyType DWord `
    -Value $RequiredValue `
    -Force | Out-Null

Write-Host "WN11-CC-000326 remediation complete."
Write-Host "PowerShell Script Block Logging has been enabled."

