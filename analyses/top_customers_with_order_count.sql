select
  c.customer_id,
  c.first_name || ' ' || c.last_name as customer_name,
  count(distinct o.order_id) as orders_count,
  min(o.order_date)::date as first_order_date,
  max(o.order_date)::date as last_order_date,
  max(o.order_status) as last_order_status
from {{ ref('stg_jaffle_shop__customers') }} c
left join {{ ref('stg_jaffle_shop__orders') }} o
  on o.customer_id = c.customer_id
  and o.order_status in ('completed','placed','shipped')
group by 1,2
order by orders_count desc, last_order_date desc
