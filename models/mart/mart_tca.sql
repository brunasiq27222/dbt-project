--Este modelo vai calcular o Total Credited Amount (TCA) por mês e por organização.
-- mart_tca.sql
WITH employee_data AS (
    SELECT
        e.employee_id,
        e.organization_id,
        oi.credit_amount,
        oi.order_date
    FROM {{ ref('stg_employee') }} e
    JOIN {{ ref('stg_order_credit_item') }} oi ON e.employee_id = oi.employee_id
    JOIN {{ ref('stg_organization') }} o ON e.organization_id = o.organization_id
    WHERE oi.status = 'Approved'
)
SELECT
    e.organization_id,
    o.name AS organization_name,
    EXTRACT(YEAR FROM oi.order_date) AS year,
    EXTRACT(MONTH FROM oi.order_date) AS month,
    SUM(e.credit_amount) AS tca
FROM employee_data e
JOIN {{ ref('stg_organization') }} o ON e.organization_id = o.organization_id
GROUP BY e.organization_id, organization_name, year, month
