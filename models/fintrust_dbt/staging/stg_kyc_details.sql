{{ config(materialized='view') }} 

select KYC_ID,
       CUSTOMER_ID,
       PAN_NUMBER,
       AADHAR_LAST4,
       KYC_STATUS,
       KYC_DATE,
       RISK_CATEGORY,
       ANNUAL_INCOME,
       UPDATED_AT,
       CASE 
    WHEN kyc_status = 'verified' THEN TRUE
    ELSE FALSE
  END AS is_verified
from {{ source('customers_1', 'kyc_details') }}
where kyc_id is not null