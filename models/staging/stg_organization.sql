-- models/staging/stg_organization.sql

with source_data as (
    select * 
    from {{ source('raw', 'organization') }}
)

select
    organization_id,
    organization_name,
    organization_industry,
    current_date as extracted_at  -- Data de extração
from source_data
