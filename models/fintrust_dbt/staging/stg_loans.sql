{{ config(materialized='view') }} 

select 
    LOAN_ID,
    CUSTOMER_ID,
    ACCOUNT_ID,
    LOAN_TYPE,
    PRINCIPAL_AMOUNT,
    OUTSTANDING_AMOUNT,
    INTEREST_RATE,
    TENURE_MONTHS,
    DISBURSED_DATE,
    DUE_DATE,
    STATUS,
    BRANCH_CODE,
    UPDATED_AT,
    DATEDIFF(month, DISBURSED_DATE, CURRENT_DATE()) AS loan_age_months,
      CASE 
    WHEN status = 'overdue' THEN TRUE
    ELSE FALSE
  END AS is_overdue
from {{ source('loans', 'loans') }}
where LOAN_ID is not null