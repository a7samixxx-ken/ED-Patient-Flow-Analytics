# 🏥 Hospital Emergency Department (ED) Patient Flow & Performance Analysis

## 📌 Executive Summary
This project analyzes 10,000 synthetic patient visits to a hospital Emergency Department (ED) over a one-year period. By leveraging **Python (Pandas)** for data cleaning and **PostgreSQL** for analysis, the goal was to identify operational bottlenecks, evaluate wait times against clinical targets, and propose actionable, data-driven strategies to improve patient flow without compromising the quality of care. 

## 🎯 Business Problem
The Emergency Department has been experiencing increasing patient volumes, leading to reports of prolonged wait times and a rising rate of patients who **Leave Without Being Seen (LWBS)**. The hospital administration needs to understand:
1. When are the peak arrival times?
2. Are urgent triage levels meeting standard wait time targets?
3. What is driving the LWBS rate, and how can it be mitigated?

## 🛠️ Data & Methodology
- **Dataset:** 10,000 synthetic ED visits containing variables such as `Arrival_Time`, `Triage_Level`, `Doctor_Seen_Time`, and `Disposition`.
- **Data Cleaning (Python):** 
  - Standardized categorical variables (e.g., standardizing Gender formats).
  - Imputed missing `Age` values using median imputation.
  - Handled data entry errors (e.g., parsing text values into integers, cleaning out-of-bounds satisfaction scores).
  - Engineered new features: `Waiting_Time_Mins`, `Length_of_Stay_Hours`, `Arrival_Hour`, and `Day_of_Week`.
- **Data Analysis (SQL):** Aggregated metrics using Window Functions, CTEs, and conditional aggregations (`FILTER` clauses).
- **Visualization (Matplotlib & Seaborn):** Designed presentation-ready charts to highlight clinical bottlenecks.

## 📊 Key Insights & Findings

### 1. The "Monday Surge"
Monday is the busiest day of the week, handling **15.8%** of total weekly volume (1,575 visits), which is a 21% increase compared to Sundays. This indicates a strong post-weekend backlog effect.

### 2. Critical Delay in Level 2 Triage
While Resuscitation cases (Level 1) are seen within an excellent average of 5.8 minutes, **Level 2 (Emergent) patients are waiting an average of 24.1 minutes**. This significantly exceeds the standard clinical target of <15 minutes, representing a critical bottleneck for high-risk patients.

### 3. Evening Bottleneck (19:00 - 21:00)
Patient arrivals build up throughout the afternoon and peak sharply during a three-hour evening window (7 PM - 10 PM), accounting for **23.8% of all daily arrivals**.

### 4. Low-Acuity Patients are Walking Out
The overall Left Without Being Seen (LWBS) rate is 4.4%. However, segmenting by Triage Level reveals the root cause: the LWBS rate spikes to **6.9% for Level 4** and **13.1% for Level 5**. Low-acuity patients are enduring the longest wait times and abandoning care as a result.

## 💡 Strategic Recommendations

Based on the clinical data analysis, I recommend the following immediate operational changes:

1. **Implement a "Fast-Track" Clinic:** Establish a dedicated See-and-Treat stream managed by General Practitioners (GPs) or Nurse Practitioners specifically for low-acuity (Level 4 and 5) cold cases. This will drastically reduce the 13.1% LWBS rate and free up ER physicians for critical cases.
2. **Evening Shift Reallocation:** Restructure the ER doctors' and nursing staff schedules to overlap heavily during the 17:00 - 22:00 window. Moving resources to match the 19:00 - 21:00 peak will directly absorb the surge.
3. **Audit Level 2 Workflows:** Initiate a clinical audit on the Triage-to-Doctor pathway for Level 2 patients to bring the 24.1-minute wait time back under the 15-minute standard threshold.

---

## 👨‍⚕️ About the Analyst
**Ahmed Sami Salah Hassan**
*6th-Year Medical Student | Head of the Academic Office (2025-2026), Medical Association | Ibn Sina University*

Bridging the gap between clinical medicine and data analytics. Passionate about utilizing data-driven insights to optimize hospital operations, improve patient care workflows, and support evidence-based healthcare management.
