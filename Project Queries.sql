--A.	BANK LOAN REPORT | SUMMARY

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

