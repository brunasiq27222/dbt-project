--Esta consulta seleciona as 3 organizações com o maior TCA por mês.

-- mart_top_3_tca.sql
SELECT
    organization_name,
    year,
    month,
    tca
FROM {{ ref('mart_tca') }}
ORDER BY tca DESC
LIMIT 3