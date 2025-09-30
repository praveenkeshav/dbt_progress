--singular test
--for customers with more than one order in the fct_orders table, 
--the average amount spent must be greater than 1.

-- This is a singular test designed to test that 
--the average of a returning customer's order is greater than or equal to one. 

{{ config(enabled = false) }}

select
    customer_id, 
    avg(amount) as average_amount
from {{ ref('fct_orders') }}
group by 1
having count(customer_id) > 1 and average_amount < 1