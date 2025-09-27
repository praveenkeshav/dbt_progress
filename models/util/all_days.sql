{{ config(materialized='table') }}

select dateadd(
    day, 
    seq4(), 
    to_date('2018-01-01')
) as date_day
from table(generator(rowcount => 7300)) -- ~20 years of daily dates