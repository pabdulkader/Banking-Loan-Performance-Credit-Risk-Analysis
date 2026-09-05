# Banking Loan Performance & Credit Risk Analysis

## Project Overview

This project analyzes banking loan performance and credit risk using SQL Server, Power Query, DAX, and Power BI.

The objective is to evaluate overall lending activity, repayment performance, good and bad loans, credit-risk patterns, borrower characteristics, and charged-off loan exposure.

The project follows an end-to-end Data Analyst workflow:

**Raw Data → SQL Server → Data Profiling → Business Analysis → Power Query → DAX → Power BI → SQL Validation**

---

## Dashboard Preview

### Loan Performance Overview

![Loan Performance Overview](05_Screenshots/Loan_Performance_Overview.png)

### Credit Risk Analysis

![Credit Risk Analysis](05_Screenshots/Credit_Risk_Analysis.png)

---

## Business Objectives

The project focuses on answering the following business questions:

- How is the overall loan portfolio performing?
- What percentage of loans are good loans versus bad loans?
- Which loan grades carry the highest credit risk?
- How does loan term affect bad loan rates?
- Which loan purposes show higher risk?
- How do interest rates and DTI vary across loan quality?
- Which charged-off loans represent higher financial exposure?

---

## Dataset Overview

The dataset contains:

- **38,576 loan records**
- **24 columns**
- **38,576 unique loan IDs**
- Data covering **2021**

Important fields include:

- Loan Amount
- Loan Status
- Interest Rate
- DTI
- Annual Income
- Grade
- Sub Grade
- Loan Purpose
- Loan Term
- Home Ownership
- Employment Length
- State
- Issue Date
- Total Payment

---

## Tools Used

- **SQL Server / SSMS**
- **Power BI**
- **Power Query**
- **DAX**
- **Excel**

---

## SQL Analysis

SQL was used for:

- Data profiling and validation
- Row and duplicate checks
- Loan status analysis
- Overall financial KPIs
- Good vs Bad Loan analysis
- Monthly lending trends
- Credit risk by grade
- Loan term analysis
- Loan purpose analysis
- Home ownership analysis
- State-level analysis
- Borrower risk profiling
- Dashboard validation

Main SQL files:

```text
SQL/
├── Data_Profiling.sql
├── Business_Analysis.sql
└── Dashboard_Validation.sql