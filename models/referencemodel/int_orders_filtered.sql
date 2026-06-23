{{
    config(materialized = 'ephemeral')
}}

Select order_id,
Customer_id,
Order_date,
Amount,
Case when amount>= '100' then 'high'
When amount>= '50' then 'medium'
Else 'low'
End as order_tier

From {{ref('stg_orders')}}
Where status!='returned'
