{{ config(materialized='view') }}

select *
from {{ ref('stg_adw__salesorderdetails') }}