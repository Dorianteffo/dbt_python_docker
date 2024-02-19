WITH distinct_date AS (
    SELECT 
        DISTINCT year, 
        month
    FROM {{ ref('stg_retail_sales') }}
)
SELECT 
    {{ dbt_utils.generate_surrogate_key(['year', 'month']) }} AS date_id, 
    year, 
    month
FROM distinct_date 
ORDER BY date_id 