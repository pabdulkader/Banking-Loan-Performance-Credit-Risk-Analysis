--kpi cards
SELECT 
	COUNT(*) AS TotalLoanApplications,
	SUM(loan_amount) AS TotalFundedAmount,
	SUM(total_payment) AS TotalAmountReceived,
	ROUND(AVG(int_rate)*100,2) AS AverageInterestRate,
	ROUND(AVG(dti)*100,2) AS AverageDTI
FROM financial_loan;



--good loan/bad loan KPI
SELECT
    SUM(CASE
        WHEN loan_status IN ('Fully Paid', 'Current') THEN 1
        ELSE 0
    END) AS GoodLoans,
    SUM(CASE
        WHEN loan_status = 'Charged Off' THEN 1
        ELSE 0
    END) AS BadLoans,
    ROUND(
        SUM(CASE
            WHEN loan_status IN ('Fully Paid', 'Current') THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*), 2
    ) AS GoodLoanPercentage,
    ROUND(
        SUM(CASE
            WHEN loan_status = 'Charged Off' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*), 2
    ) AS BadLoanPercentage,
    SUM(CASE
        WHEN loan_status = 'Charged Off'
        THEN loan_amount
        ELSE 0
    END) AS BadLoanFundedAmount
FROM financial_loan;



--monthly loan application trend
SELECT
    MONTH(issue_date) AS MonthNumber,
    DATENAME(MONTH, issue_date) AS MonthName,
    COUNT(*) AS LoanApplications
FROM financial_loan
GROUP BY
    MONTH(issue_date),
    DATENAME(MONTH, issue_date)
ORDER BY MonthNumber;



--loan application by purpose
SELECT TOP 10
    purpose,
    COUNT(*) AS LoanApplications
FROM financial_loan
GROUP BY purpose
ORDER BY LoanApplications DESC;



--loan applications and bad loan by grade
SELECT
    grade,
    COUNT(*) AS LoanApplications,
    SUM(CASE
        WHEN loan_status = 'Charged Off' THEN 1
        ELSE 0
    END) AS BadLoans,
    ROUND(
        SUM(CASE
            WHEN loan_status = 'Charged Off' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*), 2
    ) AS BadLoanRate
FROM financial_loan
GROUP BY grade
ORDER BY grade;

--loan term visual
SELECT
    term,
    COUNT(*) AS LoanApplications,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM financial_loan), 2
    ) AS PercentageOfLoans,
    ROUND(
        SUM(CASE
            WHEN loan_status = 'Charged Off' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*), 2
    ) AS BadLoanRate
FROM financial_loan
GROUP BY term;



--home ownership
SELECT
    home_ownership,
    COUNT(*) AS LoanApplications
FROM financial_loan
GROUP BY home_ownership
ORDER BY LoanApplications DESC;



--top 10 states
SELECT TOP 10
    address_state,
    COUNT(*) AS LoanApplications
FROM financial_loan
GROUP BY address_state
ORDER BY LoanApplications DESC;


--bad loan rate by purpose
SELECT
    purpose,
    COUNT(*) AS TotalLoans,
    SUM(CASE
        WHEN loan_status = 'Charged Off' THEN 1
        ELSE 0
    END) AS BadLoans,
    ROUND(
        SUM(CASE
            WHEN loan_status = 'Charged Off' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*), 2
    ) AS BadLoanRate
FROM financial_loan
GROUP BY purpose
ORDER BY BadLoanRate DESC;



--avg interest rate by loan quality
SELECT
    CASE
        WHEN loan_status IN ('Fully Paid', 'Current')
            THEN 'Good Loan'
        WHEN loan_status = 'Charged Off'
            THEN 'Bad Loan'
    END AS LoanCategory,
    ROUND(AVG(int_rate) * 100, 2) AS AverageInterestRate
FROM financial_loan
GROUP BY
    CASE
        WHEN loan_status IN ('Fully Paid', 'Current')
            THEN 'Good Loan'
        WHEN loan_status = 'Charged Off'
            THEN 'Bad Loan'
    END;

