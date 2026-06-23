{{config(materialized = 'table')}}

Select c.Customer_id,
c.first_name,
c.last_name,
c.email,
count(o.order_id) as totat_orders
sum(o.amount) as totat_spent,
sum(case when o.order_tier = 'high'
then 1 else 0 end) as high_value_orders,
min(o.order_date) as first_order_date,
max(o.order_date) as last_order_date
From {{ref('stg_customers')}} c
left join {{ref('int_order_filtered')}} o
on c.customer_id = o.customer_id
group by 1,2,3,4