WITH employee_data AS (
    SELECT *
    FROM {{ source('raw', 'employee') }}  -- Usando o esquema e tabela da camada raw
)
SELECT 
 *
FROM employee_data;
