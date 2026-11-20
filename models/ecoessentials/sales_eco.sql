{{ config(
    materialized = 'table', 
    schema = 'dw_ecoessentials'
    ) 
}}


select p.product_key, p.product_name, sum(fs.total_amount) as total_revenue
from {{ ref('fact_sales_eco') }} fs
JOIN {{ ref('dim_product_eco') }} p ON fs.product_key = p.product_key
GROUP BY p.product_key, p.product_name
ORDER BY total_revenue desc