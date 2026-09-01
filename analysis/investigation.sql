-- SOC Login Investigation
-- Purpose: Identify suspicious authentication activity

-- 1. View all login events
SELECT *
FROM login_logs;

-- 2. Identify failed login attempts
SELECT *
FROM login_logs
WHERE status = 'Failed';

-- 3. Count failed attempts by user
SELECT username, COUNT(*) AS failed_attempts
FROM login_logs
WHERE status = 'Failed'
GROUP BY username
ORDER BY failed_attempts DESC;

-- 4. Identify IP addresses associated with failed logins
SELECT source_ip, COUNT(*) AS failed_attempts
FROM login_logs
WHERE status = 'Failed'
GROUP BY source_ip
ORDER BY failed_attempts DESC;

-- 5. Identify successful logins from suspicious IP addresses
SELECT *
FROM login_logs
WHERE status = 'Success'
AND source_ip IN (
    SELECT source_ip
    FROM login_logs
    WHERE status = 'Failed'
    GROUP BY source_ip
);

-- 6. Establish a timeline for the suspicious IP address
SELECT timestamp, username, source_ip, status
FROM login_logs
WHERE source_ip = '185.220.101.45'
ORDER BY timestamp ASC;
