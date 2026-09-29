# 🛠️ Manual STIG Remediation & Verification

This page documents the manual configuration and verification methods for the
10 Windows 11 DISA STIG controls included in this project.

These methods provide an alternative way to verify or configure the security
settings outside of the automated PowerShell remediation scripts.

---

## 1. WN11-AU-000500 — Application Event Log Size

**Manual Location:**  
Event Viewer → Windows Logs → Application → Properties

**Required Setting:**  
Maximum log size: **32768 KB or greater**

---

## 2. WN11-CC-000326 — PowerShell Script Block Logging

**Manual Location:**  
`gpedit.msc` → Computer Configuration → Administrative Templates → Windows Components → Windows PowerShell → Turn on PowerShell Script Block Logging

**Required Setting:**  
**Enabled**

---

## 3. WN11-AC-000005 — Account Lockout Duration

**Manual Location:**  
`secpol.msc` → Account Policies → Account Lockout Policy → Account lockout duration

**Required Setting:**  
**15 minutes or greater**

---

## 4. WN11-AC-000010 — Account Lockout Threshold

**Manual Location:**  
`secpol.msc` → Account Policies → Account Lockout Policy → Account lockout threshold

**Required Setting:**  
**3 or fewer invalid attempts**

---

## 5. WN11-AC-000015 — Account Lockout Counter Reset

**Manual Location:**  
`secpol.msc` → Account Policies → Account Lockout Policy → Reset account lockout counter after

**Required Setting:**  
**15 minutes**

---

## 6. WN11-AC-000035 — Minimum Password Length

**Manual Location:**  
`secpol.msc` → Account Policies → Password Policy → Minimum password length

**Required Setting:**  
**14 characters or greater**

---

## 7. WN11-AC-000040 — Password Complexity

**Manual Location:**  
`secpol.msc` → Account Policies → Password Policy → Password must meet complexity requirements

**Required Setting:**  
**Enabled**

---

## 8. WN11-CC-000270 — Remote Desktop Credential Protection

**Manual Location:**  
`gpedit.msc` → Computer Configuration → Administrative Templates → Windows Components → Remote Desktop Services → Remote Desktop Connection Client → Do not allow passwords to be saved

**Required Setting:**  
**Enabled**

---

## 9. WN11-SO-000100 — SMB Client Signing

**Manual Location:**  
`secpol.msc` → Local Policies → Security Options → Microsoft network client: Digitally sign communications (always)

**Required Setting:**  
**Enabled**

---

## 10. WN11-SO-000205 — NTLMv2 / Legacy Authentication Hardening

**Manual Location:**  
`secpol.msc` → Local Policies → Security Options → Network security: LAN Manager authentication level

**Required Setting:**  
**Send NTLMv2 response only. Refuse LM & NTLM**

---

## Verification Process

After manually reviewing or configuring each security control, the system can
be rescanned using Tenable Vulnerability Management to verify that the
corresponding STIG finding is no longer detected.

**Manual Configuration / Verification → Tenable Rescan → ✅ Passed**
