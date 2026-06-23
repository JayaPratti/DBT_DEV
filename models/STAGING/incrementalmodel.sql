{{
    Config(materialized=’incremental’), unique_key = ‘order_id’
}}

Select 
Order_id,
Customer_id,
Order_date,
Amount
From {{source(‘raw’,’orders’}}

{
% if it_incremental() %

}

Where order_date > (select max(order_date) from {{this}}
{%endif%}
