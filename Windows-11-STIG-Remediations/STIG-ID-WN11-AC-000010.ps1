<#
.SYNOPSIS
This PowerShell script configures the Windows 11 account lockout threshold to three invalid logon attempts.

.NOTES
Author          : Daniel Q. Vass-Goosby
LinkedIn        :
GitHub          : https://github.com/danielvassgoosby
Date Created    : 2026-08-10
Last Modified   : 2026-08-10
Version         : 1.0
CVEs            : N/A
Plugin IDs      : N/A
STIG-ID         : WN11-AC-000010

.TESTED ON
Date(s) Tested  : 2026-08-09
Tested By       :
Systems Tested  : Windows 11
PowerShell Ver. :

.USAGE
Run this script from an elevated PowerShell session.

Example syntax:
PS C:\> .\STIG-ID-WN11-AC-000010.ps1
#>

# Set the account lockout threshold to three invalid logon attempts

& net.exe accounts /lockoutthreshold:3 | Out-Null

# Verify the remediation

$lockoutLine = net.exe accounts | Select-String "Lockout threshold"

if ($lockoutLine) {
    $threshold = [int](($lockoutLine.ToString() -split ":")[1].Trim())
} else {
    $threshold = $null
}

if ($null -ne $threshold -and $threshold -ge 1 -and $threshold -le 3) {
    Write-Host "COMPLIANT: WN11-AC-000010"
    Write-Host "Account lockout threshold is set to $threshold invalid logon attempts."
} else {
    Write-Host "NON-COMPLIANT: WN11-AC-000010"
    Write-Host "The account lockout threshold could not be verified as three or fewer attempts."
}
