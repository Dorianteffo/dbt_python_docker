{{ config(tags=['unit-test']) }}

{% call dbt_unit_testing.test ('stg_retail_sales','check_stg_models') %}
  {% call dbt_unit_testing.mock_source('raw_data', 'Retail_sales') %}
    SELECT
        2020 AS "YEAR",
        1 AS "MONTH", 
        'RELIABLE CHURCHILL LLLP' AS "SUPPLIER", 
        'b100' AS "ITEM CODE", 
        'description1' AS "ITEM DESCRIPTION",
        NULL AS "ITEM TYPE", 
        NULL  AS "RETAIL SALES", 
        506 AS "RETAIL TRANSFERS",
        673 AS "WAREHOUSE SALES"
    UNION ALL 
    SELECT
        2021 AS "YEAR",
        2 AS "MONTH", 
        NULL AS "SUPPLIER", 
        '1234' AS "ITEM CODE", 
        'description2' AS "ITEM DESCRIPTION",
        'Beer' AS "ITEM TYPE", 
        749  AS "RETAIL SALES", 
        NULL AS "RETAIL TRANSFERS",
        NULL AS "WAREHOUSE SALES"

  {% endcall %}

  {% call dbt_unit_testing.expect() %}
    SELECT
        2020 AS year,
        1 AS month, 
        'RELIABLE CHURCHILL LLLP' AS supplier, 
        'b100' AS item_code, 
        'description1' AS item_description,
        'NO_ITEM_TYPE' AS item_type, 
        -1  AS retail_sales, 
        506 AS retail_transfers,
        673 AS warehouse_sales
    UNION ALL 
    SELECT
        2021 AS year,
        2 AS month, 
        'NO_SUPPLIER' AS supplier, 
        '1234' AS item_code, 
        'description2' AS item_description,
        'Beer' AS item_type, 
        749  AS retail_sales, 
        -1 AS retail_transfers,
        -1 AS warehouse_sales
  {% endcall %}

{% endcall %}