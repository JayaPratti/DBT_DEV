{{config(materialized = 'view')
}}

Select id as  order_id,
Customer_id,
Order_date,
status,
Amount
From {{source('jaffle_shop','orders')}}
Where status!='returned'
