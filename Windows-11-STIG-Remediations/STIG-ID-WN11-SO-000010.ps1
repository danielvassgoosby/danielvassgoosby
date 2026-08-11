<#
.SYNOPSIS
This PowerShell script disables the built-in Windows Guest account.

.NOTES
Author          : Daniel Q. Vass-Goosby
LinkedIn        :
GitHub          : https://github.com/danielvassgoosby
Date Created    : 2026-08-10
Last Modified   : 2026-08-10
Version         : 1.0
CVEs            : N/A
Plugin IDs      : N/A
STIG-ID         : WN11-SO-000010

.TESTED ON
Date(s) Tested  : 2026-08-09
Tested By       :
Systems Tested  : Windows 11
PowerShell Ver. :

.USAGE
Run this script from an elevated PowerShell session.

Example syntax:
PS C:\> .\STIG-ID-WN11-SO-000010.ps1
#>

# Locate the built-in Guest account by SID RID 501

$guestAccount = Get-LocalUser | Where-Object { $_.SID.Value -match "-501$" }

# Disable the built-in Guest account

if ($null -ne $guestAccount) {
    $guestAccount | Disable-LocalUser
}

# Verify the remediation

$guestAccount = Get-LocalUser | Where-Object { $_.SID.Value -match "-501$" }

if ($null -ne $guestAccount -and $guestAccount.Enabled -eq $false) {
    Write-Host "COMPLIANT: WN11-SO-000010"
    Write-Host "The built-in Guest account '$($guestAccount.Name)' is disabled."
} else {
    Write-Host "NON-COMPLIANT: WN11-SO-000010"
    Write-Host "The built-in Guest account could not be verified as disabled."
}
