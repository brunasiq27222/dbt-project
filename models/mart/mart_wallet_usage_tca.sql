-- mart_wallet_usage_tca.sql
-- contando os pedidos aprovados por carteira e somando o TCA para cada carteira.
SELECT
    w.wallet_id,
    COUNT(oi.order_id) AS order_count,
    SUM(oi.credit_amount) AS tca
FROM {{ ref('stg_wallet') }} w
JOIN {{ ref('stg_order_credit_item') }} oi ON w.wallet_id = oi.wallet_id
WHERE oi.status = 'Approved'
GROUP BY w.wallet_id
ORDER BY order_count DESC
