-- Carrega os dados brutos da tabela order_credit_item, onde cada linha representa um pedido de crédito, que pode ou não ser aprovado para o funcionário. Não aplicamos transformações ou filtros nesta etapa.
select *
from {{ source('raw', 'order_credit_item') }}