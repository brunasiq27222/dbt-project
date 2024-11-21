-- mart_top_industries.sql
--  agrupando os dados pela indústria e contando o número de organizações em cada indústria.
SELECT
    industry,
    COUNT(organization_id) AS organization_count
FROM {{ ref('stg_organization') }}
GROUP BY industry
ORDER BY organization_count DESC
