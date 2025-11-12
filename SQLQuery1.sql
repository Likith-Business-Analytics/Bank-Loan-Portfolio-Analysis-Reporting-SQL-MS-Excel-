USE [Bank Loan DB];
SELECT * FROM Bank_loan_Database

SELECT COUNT(id) AS Total_application FROM Bank_loan_Database

SELECT COUNT(id) AS MTD_Total_application FROM Bank_loan_Database
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT COUNT(id) AS PMTD_Total_application FROM Bank_loan_Database
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS Total_Funded_Amt FROM Bank_loan_Database

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amt FROM Bank_loan_Database
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amt FROM Bank_loan_Database
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS Total_Amt_received FROM Bank_loan_Database

SELECT SUM(total_payment) AS MTD_Total_Amt_received FROM Bank_loan_Database
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS PMTD_Total_Amt_received FROM Bank_loan_Database
WHERE MONTH(issue_date) =11 AND YEAR(issue_date) = 2021

SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM Bank_loan_Database

SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate FROM Bank_loan_Database
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate FROM Bank_loan_Database
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT AVG(dti)*100 AS Avg_DTI FROM Bank_loan_Database

SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM Bank_loan_Database
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM Bank_loan_Database
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0)
/ COUNT(id) AS Good_Loan_Percentage
FROM Bank_loan_Database

SELECT COUNT(id) AS Good_Loan_Applications FROM Bank_loan_Database
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(loan_amount) AS Good_Loan_Funded_Amt FROM Bank_loan_Database
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(total_payment) AS Good_Loan_Amt_Received FROM Bank_loan_Database
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END)*100.0)
/ COUNT(id) AS Bad_Loan_Percentage FROM Bank_loan_Database

SELECT COUNT(id) AS Bad_Loan_Applications FROM Bank_loan_Database
WHERE loan_status = 'Charged Off'

SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amt FROM Bank_loan_Database
WHERE loan_status = 'Charged Off'

SELECT SUM(total_payment) AS Bad_Loan_Amt_Received FROM Bank_loan_Database
WHERE loan_status = 'Charged Off'


SELECT 
loan_status,
COUNT(id) AS LoanCount,
SUM(loan_amount) AS TotalLoan,
SUM(total_payment) AS TotalPayment,
AVG(int_rate * 100.0) AS intrestRate,
AVG(dti * 100.0) AS DTI
FROM Bank_loan_Database
GROUP BY loan_status

SELECT loan_status,
SUM(loan_amount) AS MTD_Total_Loan_Amt,
SUM(total_payment) AS MTD_Total_Amt_Received
FROM Bank_loan_Database
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021
GROUP BY loan_status


SELECT loan_status,
SUM(loan_amount) AS PMTD_Total_Loan_Amt,
SUM(total_payment) AS PMTD_Total_Amt_Received
FROM Bank_loan_Database
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021
GROUP BY loan_status

SELECT 
MONTH(issue_date) AS Month_Nmber,
DATENAME(MONTH, issue_date) AS Month_Name,
COUNT(id) AS Total_Application,
SUM(loan_amount) AS Total_Funded_Loan_Amt,
SUM(total_payment) AS Total_Payment_Amt_Received
FROM Bank_loan_Database 
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)


SELECT address_state,
COUNT(id) AS Total_Applications,
SUM(loan_amount) AS Total_Funded_Loan_Amt,
SUM(total_payment) AS Total_Payment_Amt_Received
FROM Bank_loan_Database
GROUP BY address_state
ORDER BY address_state

SELECT term AS Term,
COUNT(id) AS Total_Applications,
SUM(loan_amount) AS Total_Funded_Loan_Amt,
SUM(total_payment) AS Total_Payment_Amt_Received
FROM Bank_loan_Database
GROUP BY term
ORDER BY term


SELECT emp_length AS Employee_Length,
COUNT(id) AS Total_Applications,
SUM(loan_amount) AS Total_Funded_Loan_Amt,
SUM(total_payment) AS Total_Payment_Amt_Received
FROM Bank_loan_Database
GROUP BY emp_length
ORDER BY emp_length

SELECT purpose AS Purpose,
COUNT(id) AS Total_Applications,
SUM(loan_amount) AS Total_Funded_Loan_Amt,
SUM(total_payment) AS Total_Payment_Amt_Received
FROM Bank_loan_Database
GROUP BY purpose
ORDER BY purpose

SELECT home_ownership AS Home_Ownership,
COUNT(id) AS Total_Applications,
SUM(loan_amount) AS Total_Funded_Loan_Amt,
SUM(total_payment) AS Total_Payment_Amt_Received
FROM Bank_loan_Database
GROUP BY home_ownership
ORDER BY home_ownership