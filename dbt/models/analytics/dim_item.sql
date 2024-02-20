WITH rn_item AS (
    SELECT 
        item_code AS item_id,
        item_type,
        item_description,
        ROW_NUMBER() OVER(PARTITION BY item_code) AS rn
FROM {{ ref('stg_retail_sales') }}
)
SELECT  
    item_id,
    item_type,
    item_description
FROM rn_item
WHERE rn=1