{% snapshot scd_raw_payments %}

{{
    config(
        target_schema = 'dbt_pk',
        unique_key = 'id',
        strategy = 'timestamp',
        updated_at = '_batched_at',
        invalidate_hard_deletes=True
    )
}}

select * from {{ source('stripe', 'payment') }}

{% endsnapshot %}