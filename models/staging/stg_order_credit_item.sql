-- models/staging/stg_order_credit_item.sql

with source_data as (
    select * 
    from {{ source('raw', 'order_credit_item') }}
)

select
    order_credit_item_id,
    order_credit_id,
    id_employee,
    dt_schedule,
    status,
    total_credited_value,
    wallet_id,
    current_date as extracted_at  -- Data de extração
from source_data
