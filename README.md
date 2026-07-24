 # 🎵 Melodica Music & Dance Analytics Dashboard

Melodica Music and Dance Academy, a leading performing arts institute in the UAE, collects extensive data on student enrollments, course registrations, campus operations, payment channels, and demographic profiles. However, much of this operational data remained underutilised for high-level strategic decision-making.

This Business Intelligence project analyses Melodica’s sales and operational dataset using Power BI to uncover key insights across top-line revenue trends, branch-level operational performance, course popularity, and student demographic patterns. The goal is to deliver clear, data-driven insights that improve Melodica’s commercial growth, branch efficiency, and customer retention.

The analysis includes:
* **Sales & Enrollment Trends Analysis:** Revenue, total enrollments, and YoY revenue growth over time.
* **Branch-Level Performance:** Identifying top vs. lagging campuses (Dubai Main Campus, Abu Dhabi Hub, Sharjah Centre) and operational bottlenecks.
* **Student Demographics Insights:** Age group profiles (`Under 12`, `12–18`, `19–30`, `31–50`), retention health (Active vs. Inactive students), and average course load per student.
* **Category Performance:** Comparing revenue and volume across Music vs. Dance offerings.
* **Operational Matrix Breakdown:** Course-level financial auditing and average revenue per enrollment.

An interactive, minimalist **3-Page Power BI Dashboard** has been built to visualise these insights and support data-driven decision-making for executive leadership, regional branch managers, and marketing/curriculum strategy teams.

---

## 🗂️ 1. Project Overview

The purpose of this Power BI project is to convert raw academy operational data into a comprehensive, insight-driven analytics platform that helps Melodica understand:
* How top-line revenue ($7M+) and total enrollments (8K) are trending over time.
* Which branches drive the highest revenue contribution versus operational costs.
* How student retention rates vary across different age demographics.
* Which course categories (Music vs. Dance) generate the highest demand.
* How to optimise class schedules, marketing campaigns, and regional centre allocations.

This dashboard allows both executive and operational stakeholders to explore real-time KPIs, drill down into location-specific metrics, and take informed action to expand enrollment and improve student lifetime value.

---

## 🗃️ 2. Data Description

### Dataset Source
The project uses cleaned transactional and student data files exported from Melodica's enrollment, scheduling, and billing system.

### Included Fields
* **Enrollment & Payment Details:** Transaction ID, enrollment date, payment method, course ID, total fee, payment status.
* **Course & Category Data:** Course ID, course name (Piano, Ballet, Hip Hop, etc.), faculty category (Music vs. Dance).
* **Branch Information:** Branch ID, branch name (Dubai Main Campus, Abu Dhabi Hub, Sharjah Center), city/location.
* **Student Data:** Student ID, student age, age group cohort, enrollment status (Active / Inactive).

### Data Preparation (Power Query & SQL)
In SQL and Power Query, the following steps were performed:
* Queried raw database logs using SQL to audit record counts and aggregate revenue totals.
* Removed duplicate registrations and handled missing or null values.
* Standardised text formatting across branch names and payment channels (`Credit Card`, `Bank Transfer`).
* Normalised transaction dates into standard `YYYY-MM-DD` timestamps.
* Engineered custom age group buckets (`Under 12`, `12–18`, `19–30`, `31–50`) to reduce chart clutter.
* Constructed a contiguous date dimension table (`DimCalendar`) containing Year, Quarter, Month Number, and Month Name.

### Data Model (Star Schema)
The data was modelled in Power BI using a single-direction **Star Schema**:

![Dashboard]( https://github.com/tharannum/Melodica-Music-Dance-Analytics-Dashboard/blob/main/data%20modelling.png)

* **Fact Tables:** `FactEnrollments`, `FactPayments`
* **Dimension Tables:** `DimStudents`, `DimCourses`, `DimBranches`, `DimCalendar`, `DimPayments`
* **Relationships:** `1:*` single-direction relationships to ensure fast filter propagation and prevent circular key references.

---

## 📈 3. Analysis Performed

The following analytical components were engineered in Power BI:

### Power Query & Data Transformations
* Standardising dirty field strings and mapping branch locations.
* Creating age group attributes and conditional columns for student active statuses.

### DAX Measures
* **Total Revenue:** `= SUM(FactPayments[Amount])`
* **Total Enrollments:** `= COUNTROWS(FactEnrollments)`
* **Total Students:** `= DISTINCTCOUNT(FactEnrollments[StudentID])`
* **Average Revenue Per Student:** `= DIVIDE([Total Revenue], [Total Students], 0)`
* **YoY Revenue Growth %:** `= DIVIDE([Total Revenue] - CALCULATE([Total Revenue], SAMEPERIODLASTYEAR(DimCalendar[Date])), CALCULATE([Total Revenue], SAMEPERIODLASTYEAR(DimCalendar[Date])), 0)`
* **Active Students:** `= CALCULATE(COUNTROWS(DimStudents), TRIM(UPPER(DimStudents[Status])) = "ACTIVE")`
* **Active Student Rate %:** `= DIVIDE([Active Students], [Total Students], 0)`

### Visualizations & Dashboard Architecture
* **Minimalist UI/UX:** Built with a clean yellow and dark grey branded theme using custom navigation panels.
* **Page 1 (Executive Overview):** KPI summary cards, monthly revenue trend line chart, and branch comparison horizontal bar chart.
  ![Dashboard]( https://github.com/tharannum/Melodica-Music-Dance-Analytics-Dashboard/blob/main/melodica%201.png)
* **Page 2 (Branch & Campus Operations):** Location drop-down slicers, category distribution donut chart, and an operational matrix with in-cell data bars for course-level drill-down.
  ![Dashboard](  https://github.com/tharannum/Melodica-Music-Dance-Analytics-Dashboard/blob/main/melodica%202.png)
* **Page 3 (Student Demographics & Category Insights):** Demographics stacked column charts, Music vs. Dance category demand split, and revenue distribution by age cohorts.
  ![Dashboard](  https://github.com/tharannum/Melodica-Music-Dance-Analytics-Dashboard/blob/main/3.png)

---

## ❓ 4. Business Questions Answered

The dashboard answers the following key operational and strategic questions:
1. What is the total annual revenue ($7M) and enrollment volume across all UAE centers?
2. How does revenue perform month-over-month throughout the calendar year?
3. Which campus drives the highest revenue contribution (Dubai vs. Abu Dhabi vs. Sharjah)?
4. What is the exact category split between Music and Dance programs?
5. Which student age demographics generate the highest revenue and hold the best active retention rates?
6. What is the average revenue generated per enrolled student across different branches?
7. Which specific courses (e.g., Piano, Ballet) are top performers within individual campuses?

---

## 🔍 5. Insights & Interpretation

Below are key insights derived from the 3-page interactive dashboard:

### Insight 1 — Dubai Main Campus Leads Revenue Generation
Dubai Main Campus is the single largest contributor to business revenue, generating **$3.5M (50%)** of total revenue, followed by Abu Dhabi Hub (**$2.1M**) and Sharjah Center (**$1.4M**).

### Insight 2 — Peak Revenue Trajectory in Q1
Monthly revenue reaches its annual peak during early Q1 (**~$880K/month** in Jan–Mar) driven by new year course registrations, before stabilizing during summer months (**~$400K–$450K/month**).

### Insight 3 — Balanced Demand Across Music & Dance
Course category enrollment is split almost evenly at **50.1% Music (7.55K enrollments)** and **49.9% Dance (7.52K enrollments)**, indicating equal demand and market maturity for both performing arts faculties.

### Insight 4 — Strong Adult Demographic Engagement
Students aged **31–50** and **19–30** represent the largest active student population and highest revenue contribution, while the **Under 12** cohort exhibits lower current volume but high long-term retention value.

### Insight 5 — Regional Revenue Per Student Disparity
Dubai Main Campus achieves an average revenue per student of **$1,545**, whereas Sharjah Center yields **$1,143** per student, highlighting differences in course selection depth and premium course adoption between branches.

---

## 📌 6. Recommendations

Based on the dashboard insights, actionable recommendations for Melodica leadership include:

### 💼 Executive Leadership
* Focus capital expansion on high-yield hubs like Dubai while introducing targeted cross-selling initiatives in Sharjah to raise average revenue per student closer to the $1,500+ mark.

### 🏢 Branch Operations Teams
* Utilize the Page 2 Operational Matrix to monitor course-level enrollments monthly and reallocate underutilized studio rooms from lagging programs to high-demand offerings like Piano and Ballet.

### 🎯 Marketing & Strategy Teams
* Launch targeted campaigns for the **Under 12** demographic during Q3/Q4 back-to-school periods to capture early childhood students and build multi-year student retention pipelines.
* Maintain a balanced 50/50 advertising budget distribution between Music and Dance faculties given their equal revenue generation.

---

## 🛠️ Skills & Technologies Used

* **Power BI Desktop:** Dashboard design, custom page navigation, drill-through matrix tables, conditional formatting.
* **Power Query (M Language):** Data cleaning, text normalization, null handling, age group bucketing.
* **DAX:** Time intelligence measures, dynamic totals, YoY growth %, retention rate calculations.
* **SQL:** Initial data querying, record auditing, and DAX metric validation.
* **Data Modeling:** Star Schema design, relationship cardinality management (`1:*`).
* **Analytical Storytelling:** Designing persona-driven dashboard pages for technical and non-technical stakeholders.

---

## 🏁 7. Project Outcome

This project delivers:
* A production-ready, minimalist **3-Page Power BI Interactive Dashboard**.
* A fully transformed, normalized Star Schema data model.
* Validated DAX metrics providing real-time visibility into business KPIs.
* Strategic, data-backed operational recommendations for Melodica Music & Dance Academy.

---

## 👤 Author

**Tharannum**  
*Data Analyst | Power BI, SQL & Python*  
[LinkedIn Profile](https://linkedin.com) | [GitHub Portfolio](https://github.com/tharannum)

```
