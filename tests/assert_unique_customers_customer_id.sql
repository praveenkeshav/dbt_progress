-- assert_unique_customers_customer_id.sql
--test to make sure every row in the customers model is unique
  
select
    customer_id
from {{ ref('dim_customers') }}
group by customer_id
having count(*) > 1