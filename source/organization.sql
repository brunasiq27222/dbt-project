-- organization.sql
-- Carrega os dados brutos da tabela 'organization' sem transformação
-- A origem de dados é a tabela que contém as informações sobre as empresas
select *
from {{ source('raw', 'organization') }}