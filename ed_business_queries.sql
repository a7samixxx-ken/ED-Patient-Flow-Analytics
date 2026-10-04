-- Q1: Patient volume by day of week
SELECT day_of_week,
       COUNT(*) AS patient_volume,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM ed_visits
GROUP BY day_of_week
ORDER BY patient_volume DESC;

-- Q2: Average waiting time by triage level (LWBS / NULL waits excluded)
SELECT triage_level,
       COUNT(*) AS patients_seen,
       ROUND(AVG(waiting_time_mins)::numeric, 1) AS avg_wait_mins
FROM ed_visits
WHERE waiting_time_mins IS NOT NULL
GROUP BY triage_level
ORDER BY triage_level;

-- Q3: Top 3 peak arrival hours
SELECT arrival_hour,
       COUNT(*) AS arrivals
FROM ed_visits
GROUP BY arrival_hour
ORDER BY arrivals DESC, arrival_hour
LIMIT 3;

-- Q4: LWBS rate per arrival hour
SELECT arrival_hour,
       COUNT(*) AS total_patients,
       COUNT(*) FILTER (WHERE disposition = 'LWBS') AS lwbs_patients,
       ROUND(100.0 * COUNT(*) FILTER (WHERE disposition = 'LWBS') / COUNT(*), 2) AS lwbs_rate_pct
FROM ed_visits
GROUP BY arrival_hour
ORDER BY arrival_hour;
