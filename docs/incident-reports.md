# Incident Report – Windows Account Creation Detection
## Incident Summary
During this lab, Windows Security Event ID 4720 was monitored to identify newly created user accounts. Account creation can be a normal administrative activity, but unauthorized account creation may indicate persistence or privilege-related activity.
## Detection Details
- **Event ID:** 4720
- **Log Source:** Windows Security
- **Event:** A user account was created
- **Severity:** Medium
- **MITRE ATT&CK:** T1136 – Create Account
- **Platform:** Windows
## Investigation
Security Event ID 4720 records were collected and reviewed to identify:
- The account that created the new user
- The newly created username
- The affected Windows system
- The account domain
- The time the account was created
- Whether the activity appeared authorized or suspicious
Sample account-creation events were reviewed to simulate SOC triage and investigation.
## Analyst Assessment
Account creation alone does not confirm malicious activity. Analysts should determine whether the account was created by an authorized administrator and whether the new account matches an approved business or operational requirement.
Unexpected accounts, unusual administrator activity, or account creation followed by privilege escalation should receive additional investigation.
## Recommended Response
1. Verify the account creator.
2. Confirm the account was authorized.
3. Review subsequent authentication activity involving the new account.
4. Check for group membership or privilege changes.
5. Disable unauthorized accounts if appropriate.
6. Escalate suspicious activity according to incident-response procedures.
## Conclusion
This lab demonstrates a basic SOC workflow for detecting and investigating Windows account creation using Security Event ID 4720, PowerShell, structured detection logic, and documented analyst triage.
