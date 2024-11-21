-- wallet.sql
-- Carrega os dados brutos da tabela 'wallet' sem transformação
-- Cada linha representa um tipo de saldo, como Auxílio Home Office, ComboFlex, etc.

select *
from {{ source('raw', 'wallet') }}