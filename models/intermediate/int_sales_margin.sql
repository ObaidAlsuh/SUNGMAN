SELECT
    date_date,
    products_id,
    orders_id,
    revenue,
    quantity,
    CAST(purchase_price AS FLOAT64) AS purchase_price,
    ROUND(sales.quantity*CAST(pdt.purchase_price AS FLOAT64), 2) AS purchase_cost,
    ROUND(sales.revenue - (sales.quantity*CAST(pdt.purchase_price AS FLOAT64)), 2) AS margin
FROM {{ ref('stg_raw__sales') }} AS sales
LEFT JOIN {{ ref('stg_raw__product') }} AS pdt
    USING (products_id)