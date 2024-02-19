SELECT 
    "YEAR" as year, 
    "MONTH" AS month, 
    COALESCE("SUPPLIER",
             'NO_SUPPLIER') AS supplier, 
    "ITEM CODE" AS item_code, 
    "ITEM DESCRIPTION" AS item_description,
    COALESCE("ITEM TYPE",
             'NO_ITEM_TYPE') AS item_type, 
    COALESCE("RETAIL SALES",
             -1) AS retail_sales, 
    "RETAIL TRANSFERS" AS retail_transfers,
    "WAREHOUSE SALES" AS warehouse_sales
FROM {{ source('raw_data', 'Retail_sales')}}