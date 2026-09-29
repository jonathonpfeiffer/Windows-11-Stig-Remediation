<#
.SYNOPSIS
    This PowerShell script ensures that the minimum password length is configured to at least 14 characters.

.NOTES
    Author          : Jonathon Pfeiffer
    LinkedIn        : https://www.linkedin.com/in/jonathon-pfeiffer-912b71142/
    GitHub          :
    Date Created    : 08/31/2026
    Last Modified   :
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000035
    Documentation   : https://www.stigaview.com/products/win11/v2r8/WN11-AC-000035/

.TESTED ON
    Date(s) Tested  :
    Tested By       : Jonathon Pfeiffer
    Systems Tested  : Windows 11
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator and execute the script.

    Example:
    PS C:\> .\WN11-AC-000035.ps1
#>

# ============================================================
# STIG: WN11-AC-000035
# Requirement: Minimum password length >= 14 characters
# ============================================================

$RequiredLength = 14

# Configure minimum password length
net accounts /minpwlen:$RequiredLength

Write-Host "WN11-AC-000035 remediation complete."
Write-Host "Minimum password length set to 14 characters."


