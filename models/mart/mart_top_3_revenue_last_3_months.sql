-- mart_top_3_revenue_last_3_months.sql
-- selecionando as top 3 organizações com maior Receita nos últimos 3 meses.

SELECT
    organization_name,
    year,
    month,
    revenue
FROM {{ ref('mart_revenue') }}
WHERE (year, month) >= (SELECT MAX(year), MAX(month) - INTERVAL 3 MONTH)
ORDER BY revenue DESC
LIMIT 3
