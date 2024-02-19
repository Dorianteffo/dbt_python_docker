SELECT 
    "YEAR", 
    "MONTH", 
    COALESCE("SUPPLIER",
             'NO_SUPPLIER') AS SUPPLIER, 
    "ITEM CODE" AS ITEM_CODE, 
    "ITEM DESCRIPTION" AS ITEM_DESCRIPTION,
    COALESCE("ITEM TYPE",
             'NO_ITEM_TYPE') AS ITEM_TYPE, 
    COALESCE("RETAIL SALES",
             -1) AS RETAIL_SALES, 
    "RETAIL TRANSFERS" AS RETAIL_TRANSFERS,
    "WAREHOUSE SALES" AS WAREHOUSE_SALES
FROM {{ source('raw_data', 'Retail_sales')}}