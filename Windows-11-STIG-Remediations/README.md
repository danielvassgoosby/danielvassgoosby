# Windows 11 DISA STIG Remediation

This project documents hands-on remediation of Windows 11 DISA STIG
findings using PowerShell.

The vulnerabilities were identified through security scanning, manually
validated, remediated using PowerShell, and rescanned to confirm compliance.

## Remediation Process

1. Identify STIG finding through vulnerability scanning
2. Review the DISA STIG requirement
3. Validate the finding on the Windows 11 endpoint
4. Develop a PowerShell remediation
5. Execute the remediation with administrative privileges
6. Verify the resulting Windows configuration
7. Rescan the endpoint to confirm remediation

## Remediated STIGs

| STIG ID | Remediation |
|---|---|
| WN11-EP-000310 | Kernel DMA Protection |
| WN11-CC-000110 | Disable HTTP Printing |
| WN11-SO-000010 | Disable Built-in Guest Account |
| WN11-CC-000150 | Require Authentication After Sleep |
| WN11-CC-000315 | Disable AlwaysInstallElevated |
| WN11-CC-000345 | Disable WinRM Basic Authentication |
| WN11-SO-000220 | NTLM SSP Server Session Security |
| WN11-CC-000060 | Block Non-Domain Network Connections |
| WN11-AC-000010 | Account Lockout Threshold |
| WN11-CC-000170 | Microsoft Accounts Optional |

## Technologies

- Windows 11
- PowerShell
- DISA STIGs
- Windows Registry
- Group Policy
- Windows Security Configuration
- Vulnerability Management

## Skills Demonstrated

- Vulnerability remediation
- Windows endpoint hardening
- PowerShell scripting
- DISA STIG implementation
- Security configuration validation
- Registry and Group Policy management
- Vulnerability scan analysis
