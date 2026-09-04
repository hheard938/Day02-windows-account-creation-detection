# Day 2 – Windows Account Creation Detection
![Difficulty](https://img.shields.io/badge/Difficulty-Beginner-brightgreen)
![Platform](https://img.shields.io/badge/Platform-Windows-blue)
![Event ID](https://img.shields.io/badge/Event%20ID-4720-orange)
![MITRE](https://img.shields.io/badge/MITRE-T1136-purple)
## Project Overview
This project demonstrates a Security Operations Center (SOC) workflow for detecting and investigating Windows user account creation.
The lab focuses on Windows Security Event ID 4720, which is generated when a user account is created. I used PowerShell to collect account-creation events, structured the results for analysis, developed detection logic, and documented the investigation and response process.
## Skills Demonstrated
- Windows Security Event Log analysis
- Security Event ID 4720 investigation
- PowerShell log collection
- CSV data analysis
- Detection-rule development
- SOC alert triage
- Incident investigation
- Incident documentation
- MITRE ATT&CK mapping
## Detection Logic
The detection identifies Windows Security Event ID **4720**, which indicates that a user account was created.
Account creation may be legitimate administrative activity. However, unexpected account creation can indicate an attacker attempting to establish persistence.
Analysts should validate:
- Who created the account
- Which account was created
- Which system generated the event
- When the account was created
- Whether the activity was authorized
- Whether privilege changes occurred afterward
## MITRE ATT&CK Mapping
**Technique:** Create Account  
**Technique ID:** T1136  
**Tactic:** Persistence
## Repository Contents
- [`scripts/Export-AccountCreations.ps1`](scripts/Export-AccountCreations.ps1) – PowerShell event collection and export script
- [`data/sample-account-creations.csv`](data/sample-account-creations.csv) – Sanitized sample Event ID 4720 data
- [`detections/windows_account_creation_4720.yml`](detections/windows_account_creation_4720.yml) – Detection logic
- [`docs/incident-report.md`](docs/incident-report.md) – SOC incident investigation report
## Investigation Workflow
1. Identify Event ID 4720 activity.
2. Review the account responsible for creating the new user.
3. Identify the newly created account.
4. Validate whether the account creation was authorized.
5. Review related authentication and privilege activity.
6. Escalate suspicious activity when necessary.
7. Document findings and recommended response actions.
## Analyst Takeaway
A new Windows account is not automatically malicious. Context determines whether the activity represents legitimate administration or a potential persistence technique.
This lab demonstrates how a SOC analyst can move from event collection to detection, triage, investigation, and documentation.
