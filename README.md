# SOC Login Investigation

## Project Overview

A self-directed cybersecurity investigation into suspicious authentication activity.

This project simulates a Security Operations Center (SOC) investigation where authentication logs are analysed using SQL to identify unusual login behaviour, investigate suspicious IP activity, establish a timeline of events, and determine whether further investigation is required.

## Objectives

* Analyse authentication logs
* Identify patterns of failed and successful logins
* Investigate suspicious IP addresses and user activity
* Establish a timeline of suspicious events
* Document findings and recommendations

## Dataset

The investigation uses a simulated authentication log containing **16 login events**.

The log contains the following fields:

* `timestamp` — date and time of the login event
* `username` — account involved in the login attempt
* `source_ip` — IP address associated with the event
* `status` — whether the login was successful or failed

## Investigation Process

SQL was used to investigate the authentication logs through several stages:

1. Reviewed all login events
2. Identified failed authentication attempts
3. Counted failed attempts by username
4. Identified IP addresses associated with failed attempts
5. Investigated successful logins originating from suspicious IP addresses
6. Established a chronological timeline of activity from the suspicious IP

## Key Findings

The investigation identified **7 failed login attempts**.

The failed attempts involved two accounts:

* **Amanda:** 4 failed attempts
* **Chipo:** 3 failed attempts

All 7 failed attempts originated from the same external IP address:

`185.220.101.45`

The same IP address subsequently recorded successful logins for both Amanda and Chipo.

The timeline showed the following pattern:

**Amanda**

4 failed attempts → successful login

**Chipo**

3 failed attempts → successful login

This pattern is suspicious because the same external IP generated repeated failed authentication attempts against multiple accounts and subsequently recorded successful authentication events.

The available logs do not, however, prove that the accounts were compromised. Further investigation would be required to determine whether the successful logins were legitimate or unauthorized.

## Evidence

Screenshots of the investigation results are available in the [`screenshots`](screenshots/) directory.

Evidence collected includes:

* Complete login log dataset
* Failed login attempts
* Failed attempts by username
* Failed attempts by source IP
* Successful logins associated with the suspicious IP
* Timeline of activity from the suspicious IP

## Recommendations

Based on the observed activity, the following actions are recommended:

* Investigate the successful logins associated with `185.220.101.45`
* Verify whether Amanda and Chipo recognize the successful login activity
* Review authentication logs from a wider time period
* Check whether the suspicious IP was associated with other accounts or systems
* Consider temporarily blocking or monitoring the suspicious IP, subject to organisational security procedures
* Review account activity for additional indicators of compromise
* Encourage affected users to reset credentials if unauthorized access is confirmed
* Implement or review multi-factor authentication (MFA) for user accounts

## Skills Demonstrated

* Security log analysis
* Incident investigation
* Authentication analysis
* Networking fundamentals
* SQL
* Technical documentation
* Evidence-based security analysis

## Tools Used

* SQL
* SQLite
* GitHub

## Investigation Status

✅ **Completed**

