<#
.SYNOPSIS
    This PowerShell script ensures that the built-in Microsoft password complexity filter is enabled.

.NOTES
    Author          : Jonathon Pfeiffer
    LinkedIn        : https://www.linkedin.com/in/jonathon-pfeiffer-912b71142/
    GitHub          :
    Date Created    : 08/31/2026
    Last Modified   :
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000040
    Documentation   : https://www.stigaview.com/products/win11/v2r8/WN11-AC-000040/

.TESTED ON
    Date(s) Tested  :
    Tested By       : Jonathon Pfeiffer
    Systems Tested  : Windows 11
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator and execute the script.

    Example:
    PS C:\> .\WN11-AC-000040.ps1
#>

# ============================================================
# STIG: WN11-AC-000040
# Requirement: Password complexity must be enabled
# ============================================================

$ConfigFile = "$env:TEMP\WN11-AC-000040.cfg"
$Database   = "$env:TEMP\WN11-AC-000040.sdb"

# Export the current local security policy
secedit.exe /export /cfg $ConfigFile /quiet

# Read the existing security policy
$Policy = Get-Content $ConfigFile

# Enable password complexity
$Policy = $Policy -replace 'PasswordComplexity\s*=\s*0', 'PasswordComplexity = 1'

# Save using Unicode encoding for secedit compatibility
$Policy | Set-Content $ConfigFile -Encoding Unicode

# Apply the updated security policy
secedit.exe /configure /db $Database /cfg $ConfigFile /areas SECURITYPOLICY /quiet

# Refresh Group Policy
gpupdate /force | Out-Null

# Verify the setting
$VerifyFile = "$env:TEMP\WN11-AC-000040-verify.cfg"
secedit.exe /export /cfg $VerifyFile /quiet
Select-String -Path $VerifyFile -Pattern "PasswordComplexity"

# Clean up temporary files
Remove-Item $ConfigFile -Force -ErrorAction SilentlyContinue
Remove-Item $Database -Force -ErrorAction SilentlyContinue
Remove-Item $VerifyFile -Force -ErrorAction SilentlyContinue

Write-Host "WN11-AC-000040 remediation complete."
Write-Host "Password complexity requirements have been enabled."




