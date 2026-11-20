{{ config(
    materialized = 'table', 
    schema = 'dw_ecoessentials'
    ) 
}}

SELECT product_id as product_key, product_id, product_name, product_type, price
FROM {{ source('ecoessentials_landing', 'product') }}