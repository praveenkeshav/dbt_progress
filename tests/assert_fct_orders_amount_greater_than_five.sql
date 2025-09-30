--singular test
--tests the assertion that the order
--"amount" is always greater than 5

select
    amount
from {{ ref("fct_orders") }} 
where amount < 0  