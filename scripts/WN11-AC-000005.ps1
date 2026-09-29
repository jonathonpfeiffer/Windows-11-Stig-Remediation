<#
.SYNOPSIS
    This PowerShell script ensures that the Windows 11 account lockout duration is configured to 15 minutes or greater.

.NOTES
    Author          : Jonathon Pfeiffer
    LinkedIn        : https://www.linkedin.com/in/jonathon-pfeiffer-912b71142/
    GitHub          :
    Date Created    : 08/31/2026
    Last Modified   :
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000005
    Documentation   : https://www.stigaview.com/products/win11/v2r8/WN11-AC-000005/

.TESTED ON
    Date(s) Tested  :
    Tested By       : Jonathon Pfeiffer
    Systems Tested  : Windows 11
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator and execute the script.

    Example:
    PS C:\> .\WN11-AC-000005.ps1
#>

# ============================================================
# STIG: WN11-AC-000005
# Requirement: Account lockout duration >= 15 minutes
# ============================================================

$RequiredDuration = 15

# Configure account lockout duration
net accounts /lockoutduration:$RequiredDuration

Write-Host "WN11-AC-000005 remediation complete."
Write-Host "Account lockout duration set to 15 minutes."


