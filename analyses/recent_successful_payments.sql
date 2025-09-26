select p.payment_id, 
p.order_id, 
c.customer_id, 
c.first_name || ' ' || c.last_name as customer_name, 
o.order_date, 
p.payment_method, 
p.amount, 
p.status as payment_status, 
p.created_at as payment_date 
from {{ ref('stg_stripe__payments') }} p 
join {{ ref('stg_jaffle_shop__orders') }} o 
on p.order_id = o.order_id 
join {{ ref('stg_jaffle_shop__customers') }} c 
on o.customer_id = c.customer_id where p.status = 'success'
order by p.created_at desc