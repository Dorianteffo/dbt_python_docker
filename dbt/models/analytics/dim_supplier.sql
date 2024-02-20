WITH distinct_supplier_table AS (
    SELECT DISTINCT supplier
    FROM {{ ref('stg_retail_sales') }}
)
SELECT 
    {{ dbt_utils.generate_surrogate_key(['supplier']) }} AS supplier_id,
    supplier
FROM distinct_supplier_table
ORDER BY supplier_id 