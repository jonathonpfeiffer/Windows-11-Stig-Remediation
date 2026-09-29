# DISA STIG Windows 11 Remediation Portfolio

This project demonstrates the identification, remediation, and verification of Windows 11 DISA STIG findings using Tenable Vulnerability Management and PowerShell.

## Remediation Workflow

**Tenable Scan ❌ → PowerShell Remediation → Tenable Rescan → Passed ✅**

Each remediation was identified through a vulnerability scan, remediated using PowerShell, and validated through a follow-up Tenable scan.

---

# STIG Remediations

## STIG 1 — WN11-AU-000500
### Application Event Log Size

**Rule:**  
The Windows Application event log must be configured with a maximum size of at least 32768 KB (32 MB).

**Why It Matters:**  
Adequate event log capacity helps preserve security and audit events used for monitoring and incident investigation.

**Remediation:** PowerShell

**Before:** ❌ Non-Compliant

**After:** ✅ Compliant

**Result:** ✅ Remediated & Verified

🔧 [View PowerShell Remediation Script](scripts/WN11-AU-000500.ps1)

---

## STIG 2 — WN11-CC-000326
### PowerShell Script Block Logging

**Rule:**  
Windows PowerShell Script Block Logging must be enabled.

**Why It Matters:**  
Script Block Logging records PowerShell activity and provides valuable visibility for detecting, investigating, and responding to potentially malicious PowerShell execution.

**Remediation:** PowerShell

**Before:** ❌ Non-Compliant

**After:** ✅ Compliant

**Result:** ✅ Remediated & Verified

🔧 [View PowerShell Remediation Script](scripts/WN11-CC-000326.ps1)

---
