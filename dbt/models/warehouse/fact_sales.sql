SELECT DISTINCT
    item_table.item_id, 
    supplier_table.supplier_id,
    date_table.date_id,
    retail_sales,
    retail_transfers,
    warehouse_sales
FROM {{ ref('stg_retail_sales') }} as stg_table 
JOIN {{ ref('dim_item') }} AS item_table ON stg_table.item_code=item_table.item_id
JOIN {{ ref('dim_date') }} AS date_table ON stg_table.year = date_table.year AND stg_table.month = date_table.month
JOIN {{ ref('dim_supplier') }} AS supplier_table ON stg_table.supplier = supplier_table.supplier