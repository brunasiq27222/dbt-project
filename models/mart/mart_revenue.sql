-- mart_revenue.sql

-- A Receita (Revenue) é calculada com base no TCA (Total Credited Amount)
-- e no número de funcionários por organização.
-- As regras de receita são aplicadas com base no número de funcionários:
-- - Organizações com mais de 800 funcionários: 0.70% de TCA
-- - Organizações com mais de 100 funcionários: 0.75% de TCA
-- - Organizações com menos de 100 funcionários: 0.90% de TCA

WITH tca_data AS (
    SELECT
        e.organization_id,
        SUM(oi.credit_amount) AS tca,
        COUNT(DISTINCT e.employee_id) AS employee_count
    FROM {{ ref('stg_order_credit_item') }} oi
    JOIN {{ ref('stg_employee') }} e ON oi.employee_id = e.employee_id
    WHERE oi.status = 'Approved'
    GROUP BY e.organization_id
)
SELECT
    td.organization_id,
    td.tca,
    td.employee_count,
    CASE
        -- Se a organização tiver mais de 800 funcionários, aplica 0.70% do TCA
        WHEN td.employee_count > 800 THEN td.tca * 0.007
        
        -- Se a organização tiver mais de 100 funcionários, aplica 0.75% do TCA
        WHEN td.employee_count > 100 THEN td.tca * 0.0075
        
        -- Se a organização tiver menos de 100 funcionários, aplica 0.90% do TCA
        ELSE td.tca * 0.009
    END AS revenue
FROM tca_data td
