-- Carrega os dados brutos da tabela 'employee' sem transformação
-- A origem de dados é a tabela que contém as informações sobre os funcionários
select *
from {{ source('raw', 'employee') }}