-- mart_revenue_growth.sql
WITH revenue_data AS (
    SELECT
        year,
        month,
        SUM(credit_amount) AS total_revenue
    FROM {{ ref('mart_revenue') }}
    GROUP BY year, month
)
SELECT
    year,
    month,
    total_revenue,
    (total_revenue - LAG(total_revenue) OVER (ORDER BY year, month)) / LAG(total_revenue) OVER (ORDER BY year, month) * 100 AS growth_rate
FROM revenue_data --usando a função LAG() para calcular o crescimento da receita de um mês para o próximo. A fórmula de crescimento é (total_revenue - LAG(total_revenue)) / LAG(total_revenue) * 100.
ORDER BY year, month
