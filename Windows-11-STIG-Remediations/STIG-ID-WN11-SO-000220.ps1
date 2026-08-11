<#
.SYNOPSIS
This PowerShell script configures the minimum session security requirements for NTLM SSP based servers to require NTLMv2 session security and 128-bit encryption.

.NOTES
Author          : Daniel Q. Vass-Goosby
LinkedIn        :
GitHub          : https://github.com/danielvassgoosby
Date Created    : 2026-08-10
Last Modified   : 2026-08-10
Version         : 1.0
CVEs            : N/A
Plugin IDs      : N/A
STIG-ID         : WN11-SO-000220

.TESTED ON
Date(s) Tested  : 2026-08-10
Tested By       :
Systems Tested  : Windows 11
PowerShell Ver. :

.USAGE
Run this script from an elevated PowerShell session.

Example syntax:
PS C:\> .\STIG-ID-WN11-SO-000220.ps1
#>

# Define the registry path and required value
# 0x20080000 = Require NTLMv2 session security + Require 128-bit encryption

$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0"
$valueName = "NTLMMinServerSec"
$valueData = 537395200

# Check if the registry path exists; if not, create it

if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Configure the required STIG registry value

New-ItemProperty -Path $registryPath -Name $valueName -PropertyType DWord -Value $valueData -Force | Out-Null

# Verify the remediation

$currentValue = (Get-ItemProperty -Path $registryPath -Name $valueName -ErrorAction SilentlyContinue).$valueName

if ($currentValue -eq $valueData) {
    Write-Host "COMPLIANT: WN11-SO-000220"
    Write-Host "NTLMMinServerSec is set to 0x20080000 ($valueData)."
} else {
    Write-Host "NON-COMPLIANT: WN11-SO-000220"
    Write-Host "The required registry configuration could not be verified."
}
