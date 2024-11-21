-- models/staging/stg_wallet.sql

with source_data as (
    select * 
    from {{ source('raw', 'wallet') }}
)

select
    wallet_id,
    name,
    description,
    current_date as extracted_at  -- Data de extração
from source_data
