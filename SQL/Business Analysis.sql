--good loan vs bad loan
SELECT
    COUNT(*) AS TotalLoans,
    SUM(CASE 
        WHEN loan_status IN ('Fully Paid', 'Current') THEN 1 
        ELSE 0 
    END) AS GoodLoans,
    SUM(CASE 
        WHEN loan_status = 'Charged Off' THEN 1 
        ELSE 0 
    END) AS BadLoans,
    ROUND(
        SUM(CASE WHEN loan_status IN ('Fully Paid', 'Current') THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS GoodLoanPercentage,
    ROUND(
        SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS BadLoanPercentage
FROM financial_loan;



--loan performance status
SELECT
    loan_status,
    COUNT(*) AS TotalLoans,
    SUM(loan_amount) AS FundedAmount,
    SUM(total_payment) AS AmountReceived,
    ROUND(AVG(int_rate) * 100, 2) AS AverageInterestRate,
    ROUND(AVG(dti) * 100, 2) AS AverageDTI
FROM financial_loan
GROUP BY loan_status
ORDER BY TotalLoans DESC;



----monthly loan trend
SELECT
    MONTH(issue_date) AS MonthNumber,
    DATENAME(MONTH, issue_date) AS MonthName,
    COUNT(*) AS LoanApplications,
    SUM(loan_amount) AS FundedAmount,
    SUM(total_payment) AS AmountReceived
FROM financial_loan
GROUP BY
    MONTH(issue_date),
    DATENAME(MONTH, issue_date)
ORDER BY MonthNumber;



--credit risk by grade
SELECT
    grade,
    COUNT(*) AS TotalLoans,
    SUM(CASE
        WHEN loan_status = 'Charged Off' THEN 1
        ELSE 0
    END) AS BadLoans,
    ROUND(
        SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS BadLoanRate,
    ROUND(AVG(int_rate) * 100, 2) AS AverageInterestRate
FROM financial_loan
GROUP BY grade
ORDER BY grade;


--loan performance by term
SELECT
    term,
    COUNT(*) AS TotalLoans,
    SUM(loan_amount) AS FundedAmount,
    SUM(CASE
        WHEN loan_status = 'Charged Off' THEN 1
        ELSE 0
    END) AS BadLoans,
    ROUND(
        SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS BadLoanRate
FROM financial_loan
GROUP BY term
ORDER BY BadLoanRate DESC;


--loan performance by purpose
SELECT
    purpose,
    COUNT(*) AS TotalLoans,
    SUM(loan_amount) AS FundedAmount,
    SUM(total_payment) AS AmountReceived,
    ROUND(
        SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS BadLoanRate
FROM financial_loan
GROUP BY purpose
ORDER BY TotalLoans DESC;


--loan performance by home ownership
SELECT
    home_ownership,
    COUNT(*) AS TotalLoans,
    SUM(loan_amount) AS FundedAmount,
    SUM(total_payment) AS AmountReceived,
    ROUND(
        SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS BadLoanRate
FROM financial_loan
GROUP BY home_ownership
ORDER BY TotalLoans DESC;




--loan application by state
SELECT
    address_state,
    COUNT(*) AS LoanApplications,
    SUM(loan_amount) AS FundedAmount,
    SUM(total_payment) AS AmountReceived
FROM financial_loan
GROUP BY address_state
ORDER BY LoanApplications DESC;



--loan performance by employment length
SELECT
    emp_length,
    COUNT(*) AS TotalLoans,
    SUM(loan_amount) AS FundedAmount,
    ROUND(
        SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS BadLoanRate
FROM financial_loan
GROUP BY emp_length
ORDER BY TotalLoans DESC;


--borrower risk profile by loan status
SELECT
    loan_status,
    ROUND(AVG(annual_income), 2) AS AverageAnnualIncome,
    ROUND(AVG(dti) * 100, 2) AS AverageDTI,
    ROUND(AVG(int_rate) * 100, 2) AS AverageInterestRate,
    ROUND(AVG(loan_amount), 2) AS AverageLoanAmount
FROM financial_loan
GROUP BY loan_status;




