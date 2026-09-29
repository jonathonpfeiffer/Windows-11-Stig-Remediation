<#
.SYNOPSIS
    This PowerShell script ensures that the number of allowed bad logon attempts is configured to three or less.

.NOTES
    Author          : Jonathon Pfeiffer
    LinkedIn        : https://www.linkedin.com/in/jonathon-pfeiffer-912b71142/
    GitHub          :
    Date Created    : 08/31/2026
    Last Modified   :
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000010
    Documentation   : https://www.stigaview.com/products/win11/v2r8/WN11-AC-000010/

.TESTED ON
    Date(s) Tested  :
    Tested By       : Jonathon Pfeiffer
    Systems Tested  : Windows 11
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator and execute the script.

    Example:
    PS C:\> .\WN11-AC-000010.ps1
#>

# ============================================================
# STIG: WN11-AC-000010
# Requirement: Account lockout threshold <= 3 attempts
# ============================================================

$RequiredThreshold = 3

# Configure account lockout threshold
net accounts /lockoutthreshold:$RequiredThreshold

Write-Host "WN11-AC-000010 remediation complete."
Write-Host "Account lockout threshold set to 3 failed logon attempts."


