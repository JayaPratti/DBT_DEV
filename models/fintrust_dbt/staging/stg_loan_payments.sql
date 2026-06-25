{{ config(materialized='view') }} 

select 
    PAYMENT_ID,
    LOAN_ID,
    PAYMENT_DATE,
    EMI_AMOUNT,
    PRINCIPAL_PAID,
    INTEREST_PAID,
    PENALTY_AMOUNT,
    PAYMENT_STATUS,
    DAYS_OVERDUE,
    (principal_paid + interest_paid + penalty_amount) AS total_paid
from {{ source('loans', 'loan_payments') }}
where PAYMENT_ID is not null