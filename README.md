# Bank-Loan-Analysis
This bank loan report provides a comprehensive overview of loan applications, funded amounts, and received payments, with key metrics like interest rates and debt-to-income ratio. It analyzes trends across months, states, terms, employment lengths, loan purposes, and homeownership, offering valuable insights for financial assessments.

<img src="Cover Image.jpg"  />

## DASHBOARD 1: SUMMARY

<img src="Summary.png"  />

## KPIs:
**1. Total Loan Applications:** We need to calculate the total number of loan applications received during a specified period. Additionally, it is essential to monitor the Month-to-Date (MTD) Loan Applications and track changes Month-over-Month (MoM).

**2. Total Funded Amount:** Understanding the total amount of funds disbursed as loans is crucial. We also want to keep an eye on the MTD Total Funded Amount and analyse the Month-over-Month (MoM) changes in this metric.

**3. Total Amount Received:** racking the total amount received from borrowers is essential for assessing the bank's cash flow and loan repayment. We should analyse the Month-to-Date (MTD) Total Amount Received and observe the Month-over-Month (MoM) changes.

**4. Average Interest Rate:** Calculating the average interest rate across all loans, MTD, and monitoring the Month-over-Month (MoM) variations in interest rates will provide insights into our lending portfolio's overall cost.

**5. Average Debt-to-Income Ratio (DTI):** Evaluating the average DTI for our borrowers helps us gauge their financial health. We need to compute the average DTI for all loans, MTD, and track Month-over-Month (MoM) fluctuations.

## Good Loan v Bad Loan KPI’s

**Good Loan:**
* Good Loan Application Percentage
* Good Loan Applications
* Good Loan Funded Amount
* Good Loan Total Received Amount

**Bad Loan:**
* Bad Loan Application Percentage
* Bad Loan Applications
* Bad Loan Funded Amount
* Bad Loan Total Received Amount

## Loan Status Grid View
In order to gain a comprehensive overview of our lending operations and monitor the performance of loans, we aim to create a grid view report categorized by 'Loan Status.’ By providing insights into metrics such as 'Total Loan Applications,' 'Total Funded Amount,' 'Total Amount Received,' 'Month-to-Date (MTD) Funded Amount,' 'MTD Amount Received,' 'Average Interest Rate,' and 'Average Debt-to-Income Ratio (DTI),' this grid view will empower us to make data-driven decisions and assess the health of our loan portfolio.

## DASHBOARD 2: OVERVIEW

<img src="Overview.png"  />

## CHARTS

**1. Monthly Trends by Issue Date (Line Chart):** To identify seasonality and long-term trends in lending activities

**2. Regional Analysis by State (Filled Map):**  To identify regions with significant lending activity and assess regional disparities

**3. Loan Term Analysis (Donut Chart):** To allow the client to understand the distribution of loans across various term lengths.

**4. Employee Length Analysis (Bar Chart):** How lending metrics are distributed among borrowers with different employment lengths, helping us assess the impact of employment history on loan applications.

**5. Loan Purpose Breakdown (Bar Chart):** Will provide a visual breakdown of loan metrics based on the stated purposes of loans, aiding in the understanding of the primary reasons borrowers seek financing.

**6. Home Ownership Analysis (Tree Map):** For a hierarchical view of how home ownership impacts loan applications and disbursements.

**Metrics to be shown: 'Total Loan Applications,' 'Total Funded Amount,' and 'Total Amount Received'**


## DASHBOARD 3: DETAILS

<img src="Details.png"  />

## GRID
Need for a comprehensive 'Details Dashboard' that provides a consolidated view of all the essential information within our loan data. This Details Dashboard aims to offer a holistic snapshot of key loan-related metrics and data points, enabling users to access critical information efficiently.

## Objective:
The primary objective of the Details Dashboard is to provide a comprehensive and user-friendly interface for accessing vital loan data. It will serve as a one-stop solution for users seeking detailed insights into our loan portfolio, borrower profiles, and loan performance.

## Features

**1. Comprehensive Loan Insights:** Provides an overview of loan applications, funding, repayments, and interest rates, with detailed metrics for financial assessment.

**2. Segmented Analysis:** Breaks down data by month, state, term, employment length, loan purpose, and homeownership for targeted insights.

**3. Loan Quality Evaluation** Assesses loan status, distinguishing between good and bad loans to identify financial trends and risk factors.

## SQL : Bank Loan Data Extraction & Performance Metrics

```sql

--A.BANK LOAN REPORT | SUMMARY

--KPI's

--Total Loan Applications

SELECT
	COUNT(id) as Total_Loan_Applications
FROM bank_loan

--MTD Loan Applications

SELECT
	COUNT(id) as MTD_Total_Loan_Applications
FROM bank_loan
WHERE MONTH(issue_date) = 12 And YEAR(issue_date) = 2021

--PMTD Loan Applications

SELECT
	COUNT(id) as PMTD_Total_Loan_Applications
FROM bank_loan
WHERE MONTH(issue_date) = 11 And YEAR(issue_date) = 2021

--Total Funded Amount

SELECT
	SUM(loan_amount) as Total_Loan_Amount
FROM bank_loan

--MTD Total Funded Amount

SELECT
	SUM(loan_amount) as MTD_Total_Loan_Amount
FROM bank_loan
WHERE MONTH(issue_date) = 12 And YEAR(issue_date) = 2021

-- PMTD Total Funded Amount

SELECT
	SUM(loan_amount) as MTD_Total_Loan_Amount
FROM bank_loan
WHERE MONTH(issue_date) = 11 And YEAR(issue_date) = 2021

--Total Amount Received

SELECT
	SUM(total_payment) as Total_Amount_Received
FROM bank_loan

--MTD Total Amount Received

SELECT
	SUM(total_payment) as MTD_Total_Amount_Received
FROM bank_loan
WHERE MONTH(issue_date) = 12 And YEAR(issue_date) = 2021

--PMTD Total Amount Received

SELECT
	SUM(total_payment) as PMTD_Total_Amount_Received
FROM bank_loan
WHERE MONTH(issue_date) = 11 And YEAR(issue_date) = 2021

--Average Interest Rate

SELECT
	AVG(int_rate)*100 as Average_Int_Rate
FROM bank_loan

--MTD Average Interest

SELECT
	AVG(int_rate)*100 as MTD_Average_Int_Rate
FROM bank_loan
WHERE MONTH(issue_date) = 12 And YEAR(issue_date) = 2021

--PMTD Average Interest

SELECT
	AVG(int_rate)*100 as PMTD_Average_Int_Rate
FROM bank_loan
WHERE MONTH(issue_date) = 11 And YEAR(issue_date) = 2021

--Avg DTI

SELECT
	AVG(dti)*100 as Average_DTI
FROM bank_loan

--MTD Avg DTI

SELECT
	AVG(dti)*100 as MTD_Average_DTI
FROM bank_loan
WHERE MONTH(issue_date) = 12 And YEAR(issue_date) = 2021

--PMTD Avg DTI

SELECT
	AVG(dti)*100 as PMTD_Average_DTI
FROM bank_loan
WHERE MONTH(issue_date) = 11 And YEAR(issue_date) = 2021

--GOOD LOAN ISSUED

--Good Loan Percentage

SELECT
	(COUNT(CASE WHEN loan_status = 'Fully Paid' or loan_status ='Current' THEN id END)
	* 100) /COUNT(id) as Good_Loan_Percentage
FROM bank_loan

--Good Loan Applications

SELECT
	COUNT(id) as Good_Loan_Applications
FROM bank_loan
WHERE loan_status ='Fully Paid' or loan_status = 'Current'

--Good Loan Funded Amount

SELECT
	SUM(loan_amount) as Good_Loan_Funded
FROM bank_loan
WHERE loan_status ='Fully Paid' or loan_status = 'Current'

--Good Loan Amount Received

SELECT
	SUM(total_payment) as Good_Loan_Amount_Received
FROM bank_loan
WHERE loan_status ='Fully Paid' or loan_status = 'Current'


--BAD LOAN ISSUED

--Bad Loan Percentage

SELECT
	(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END)
	* 100) /COUNT(id) as Bad_Loan_Percentage
FROM bank_loan

--Bad Loan Applications

SELECT
	COUNT(id) as Bad_Loan_Applications
FROM bank_loan
WHERE loan_status = 'Charged Off'

--Bad Loan Funded Amount

SELECT
	SUM(loan_amount) as Bad_Loan_Funded
FROM bank_loan
WHERE loan_status = 'Charged Off'

--Bad Loan Amount Received

SELECT
	SUM(total_payment) as Bad_Loan_Amount_Received
FROM bank_loan
WHERE loan_status = 'Charged Off'


--LOAN STATUS

SELECT 
	loan_status,
	COUNT(id) as LoanCount,
	SUM(total_payment) as Total_Amount_Received,
	SUM(loan_amount) as Total_Funded_Amount,
	AVG(int_rate*100) as Interest_Rate,
	AVG(dti*100) as DTI
FROM bank_loan
GROUP BY
	loan_status

SELECT
	loan_status,
	SUM(total_payment) as MTD_Total_Amount_Received,
	SUM(loan_amount) as MTD_Total_Funded_Amount
FROM bank_loan
WHERE MONTH(issue_date) = 12 And YEAR(issue_date) = 2021
GROUP BY loan_status

--B. BANK LOAN REPORT | OVERVIEW

--MONTH

SELECT
	MONTH(issue_date) as Month_Number,
	DATENAME(Month, issue_date) as Month_Name,
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
FROM bank_loan
GROUP BY MONTH(issue_date), DATENAME(Month, issue_date)
ORDER BY MONTH(issue_date)

--STATE

Select
	address_state as State,
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
FROM bank_loan
GROUP BY address_state
ORDER BY address_state

--TERM

SELECT
	term,
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
FROM bank_loan
GROUP BY term
ORDER BY term

--EMPLOYEE LENGTH

SELECT
	emp_length,
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
FROM bank_loan
GROUP BY emp_length
ORDER BY emp_length

--LOAN PURPOSE

SELECT
	purpose,
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
FROM bank_loan
GROUP BY purpose
ORDER BY purpose

--HOME OWNERSHIP

SELECT 
	home_ownership,
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
FROM bank_loan
GROUP BY home_ownership
ORDER BY home_ownership

/*Note: We have applied multiple Filters on all the dashboards. You can check the results for the filters as well by modifying
the query and comparing the results.
For e.g
See the results when we hit the Grade A in the filters for dashboards. */

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose

```

