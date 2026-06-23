{{
Config(materialized = 'view')
}}
Select id as customer_id,
First_name,
Last_name,
Email
From {{source('jaffle_shop','customers')
