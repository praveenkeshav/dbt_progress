{% set old_relation = ref('fct_orders_deprecated') %}

{% set dbt_relation = ref('fct_orders') %}

{{ audit_helper.quick_are_relations_identical(
    a_relation = old_relation,
    b_relation = dbt_relation,
    columns = None
) }}