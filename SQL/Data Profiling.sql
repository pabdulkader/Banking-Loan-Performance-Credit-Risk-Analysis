
--total rows and unique loans
SELECT 
	COUNT(*) AS TotalRows,
	COUNT(DISTINCT id) AS UniqueLoans
FROM financial_loan;


--loan status distribution
SELECT 
	loan_status,
	COUNT(*) AS TotalLoans
FROM financial_loan
GROUP BY loan_status
ORDER BY TotalLoans DESC;


--missing employee titles
SELECT 
	COUNT(*) AS MissingEmployeeTitles
FROM financial_loan
WHERE emp_title IS NULL;


--main KPIs
SELECT
    COUNT(*) AS TotalLoanApplications,
    SUM(loan_amount) AS TotalFundedAmount,
    SUM(total_payment) AS TotalAmountReceived,
    AVG(annual_income) AS AverageAnnualIncome,
    AVG(int_rate) * 100 AS AverageInterestRate,
    AVG(dti) * 100 AS AverageDTI
FROM financial_loan;


----duplicate loan IDs
SELECT
    id,
    COUNT(*) AS LoanCount
FROM financial_loan
GROUP BY id
HAVING COUNT(*) > 1;


--issue date range
SELECT
    MIN(issue_date) AS FirstIssueDate,
    MAX(issue_date) AS LastIssueDate
FROM financial_loan;



