SELECT 
    "YEAR"::INTEGER as year, 
    "MONTH"::INTEGER AS month, 
    COALESCE("SUPPLIER",
             'NO_SUPPLIER')::TEXT AS supplier, 
    "ITEM CODE"::TEXT AS item_code, 
    "ITEM DESCRIPTION"::TEXT AS item_description,
    COALESCE("ITEM TYPE",
             'NO_ITEM_TYPE')::TEXT AS item_type, 
    COALESCE("RETAIL SALES",
             -1)::FLOAT AS retail_sales, 
    COALESCE("RETAIL TRANSFERS",
            -1)::FLOAT AS retail_transfers,
    COALESCE("WAREHOUSE SALES",
            -1)::FLOAT AS warehouse_sales
FROM {{ dbt_unit_testing.source('raw_data', 'Retail_sales') }}