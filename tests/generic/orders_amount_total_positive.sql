{% test orders_amount_total_positive(model, column_name) %}

    select
        {{ column_name }}
    from {{ ref("fct_orders") }}
    where {{ column_name }} < 0   

{% endtest %}