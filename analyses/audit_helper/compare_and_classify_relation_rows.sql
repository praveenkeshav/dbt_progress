{% set old_relation = ref('fct_orders_deprecated') -%}

{% set dbt_relation = ref('fct_orders') %}

{{ audit_helper.compare_and_classify_relation_rows(
    a_relation = old_relation,
    b_relation = dbt_relation,
    primary_key_columns = ["order_id"],
    columns = None
) }}