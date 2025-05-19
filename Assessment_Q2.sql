WITH transaction_counts AS 
  (
    SELECT a.id AS customer_id,
      COUNT(b.id) AS transaction_count,
      COUNT(b.id) / COUNT(DISTINCT DATE_FORMAT(b.transaction_date, '%Y-%m')) AS avg_transactions_per_month -- Count the id and divide by the count of distinct transaction date by month 
    FROM users_customuser a
    LEFT JOIN savings_savingsaccount b
    ON a.id = b.owner_id
    GROUP BY a.id
  )

SELECT
  CASE
      WHEN avg_transactions_per_month >= 10 THEN 'High Frequency'
      WHEN avg_transactions_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
      ELSE 'Low Frequency'
  END AS frequency_category,
  COUNT(customer_id) AS customer_count,
  AVG(avg_transactions_per_month) AS avg_transactions_per_month
FROM transaction_counts
GROUP BY frequency_category;
