<#
.SYNOPSIS
    This PowerShell script ensures that the bad logon counter is reset after 15 minutes.

.NOTES
    Author          : Jonathon Pfeiffer
    LinkedIn        : https://www.linkedin.com/in/jonathon-pfeiffer-912b71142/
    GitHub          :
    Date Created    : 08/31/2026
    Last Modified   :
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000015
    Documentation   : https://www.stigaview.com/products/win11/v2r8/WN11-AC-000015/

.TESTED ON
    Date(s) Tested  :
    Tested By       : Jonathon Pfeiffer
    Systems Tested  : Windows 11
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator and execute the script.

    Example:
    PS C:\> .\WN11-AC-000015.ps1
#>

# ============================================================
# STIG: WN11-AC-000015
# Requirement: Reset account lockout counter after 15 minutes
# ============================================================

$RequiredResetTime = 15

# Configure the lockout counter reset time
net accounts /lockoutwindow:$RequiredResetTime

Write-Host "WN11-AC-000015 remediation complete."
Write-Host "Account lockout counter reset time set to 15 minutes."




