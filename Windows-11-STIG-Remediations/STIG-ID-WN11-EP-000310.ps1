<#
.SYNOPSIS
This PowerShell script configures the Windows 11 Kernel DMA Protection enumeration policy to block all external devices incompatible with Kernel DMA Protection.

.NOTES
Author          : Daniel Q. Vass-Goosby
LinkedIn        :
GitHub          : https://github.com/danielvassgoosby
Date Created    : 2026-08-10
Last Modified   : 2026-08-10
Version         : 1.0
CVEs            : N/A
Plugin IDs      : N/A
STIG-ID         : WN11-EP-000310

.TESTED ON
Date(s) Tested  : 2026-08-09
Tested By       :
Systems Tested  : Windows 11
PowerShell Ver. :

.USAGE
Run this script from an elevated PowerShell session.

Example syntax:
PS C:\> .\STIG-ID-WN11-EP-000310.ps1
#>

# Define the registry path and required value

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection"
$valueName = "DeviceEnumerationPolicy"
$valueData = 0

# Check if the registry path exists; if not, create it

if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Configure the required STIG registry value

New-ItemProperty -Path $registryPath -Name $valueName -PropertyType DWord -Value $valueData -Force | Out-Null

# Verify the remediation

$currentValue = (Get-ItemProperty -Path $registryPath -Name $valueName -ErrorAction SilentlyContinue).$valueName

if ($null -ne $currentValue -and $currentValue -eq $valueData) {
    Write-Host "COMPLIANT: WN11-EP-000310"
    Write-Host "Registry value '$valueName' is set to '$valueData' at '$registryPath'."
} else {
    Write-Host "NON-COMPLIANT: WN11-EP-000310"
    Write-Host "The required registry configuration could not be verified."
}
