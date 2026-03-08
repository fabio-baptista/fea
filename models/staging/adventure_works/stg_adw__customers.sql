with source_customer as (
    select *
    from {{ source('adw_raw', 'sales_customer') }}
)

select
    cast(customerid as int) as pk_customer,
    cast(personid as int) as fk_person,
    cast(storeid as int) as fk_store
from source_customer
