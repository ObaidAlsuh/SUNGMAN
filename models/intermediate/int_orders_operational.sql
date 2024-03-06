SELECT
    O.*,
    S.shipping_fee,
    S.logcost,
    S.ship_cost,
    ROUND((CAST(margin AS FLOAT64) + CAST(shipping_fee AS FLOAT64)) - (CAST(ship_cost AS FLOAT64) + CAST(logcost AS FLOAT64)), 2) AS operational_margin
FROM {{ ref('int_orders_margin') }} AS O
LEFT JOIN {{ ref('stg_raw__ship') }} AS S
    USING (orders_id)
ORDER by
    orders_id DESC