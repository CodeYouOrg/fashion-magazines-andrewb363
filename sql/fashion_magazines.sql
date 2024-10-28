WITH orderscustomers_join AS (
SELECT * 
FROM orders
LEFT JOIN customers
  ON orders.customer_id = customers.customer_id
WHERE order_status = 'Unpaid'
)

SELECT customers.customer_name,
  PRINTF("$%.2f", SUM(subscriptions.subscription_length * subscriptions.price_per_month)) AS Amount_Due
FROM orderscustomers_join
LEFT JOIN subscriptions
  ON orderscustomers_join.subscription_id = subscriptions.subscription_id
WHERE subscriptions.description = 'Fashion Magazine'
GROUP BY customers.customer_name;