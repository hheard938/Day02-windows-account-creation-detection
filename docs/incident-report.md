# SOC Incident Report – Windows Account Creation
## Incident Summary
A Windows Security Event ID 4720 was identified, indicating that a new local user account was created. The event was reviewed to determine whether the account creation represented authorized administrative activity or potentially suspicious persistence.
## Event Details
- Event ID: 4720
- Event Type: User Account Creation
- Log Source: Windows Security
- Severity: Medium
- MITRE ATT&CK Technique: T1136 – Create Account
- MITRE ATT&CK Tactic: Persistence
## Investigation
The analyst reviewed the account-creation event and examined:
- The account responsible for creating the new user
- The newly created username
- The originating computer
- The time of account creation
- Related authentication activity
- Potential privilege changes following account creation.
The activity was compared against expected administrative behavior to determine whether the account was authorized.
## Analyst Assessment
Creation of a Windows user account is not automatically malicious. Administrators routinely create accounts for legitimate operational purposes.
However, attackers may also create accounts to maintain persistent access to a compromised system.
Event ID 4720 should therefore be investigated in context with authentication events, privilege changes, endpoint activity, and approved administrative actions.
## Recommended Response
If the account is unauthorized:
1. Disable the newly created account.
2. Investigate the account that created it.
3. Review recent authentication activity.
4. Check for privilege escalation or group membership changes.
5. Review the affected endpoint for additional suspicious activity.
6. Reset compromised credentials when appropriate.
7. Escalate the incident according to the organization's incident-response procedures.
## Conclusion
This investigation demonstrates a basic SOC workflow involving event collection, detection, triage, investigation, MITRE ATT&CK mapping, and recommended response actions.
has context menu
