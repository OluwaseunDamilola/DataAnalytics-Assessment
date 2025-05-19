WITH ranked_transactions AS (
  SELECT a.owner_id,
    CASE
      WHEN a.is_a_fund = 1 THEN 'investment'
      WHEN a.is_regular_savings = 1 THEN 'savings'
      END AS account_type,
    MAX(DATE(b.transaction_date)) AS last_transaction_date,
    DATEDIFF(CURRENT_DATE, MAX(b.transaction_date)) AS inactivity_days
  FROM plans_plan a
  LEFT JOIN savings_savingsaccount b
  ON a.owner_id = b.owner_id
  WHERE (a.is_a_fund = 1 OR a.is_regular_savings = 1) -- Ensures only savings and investment accounts
    AND b.transaction_date IS NOT NULL
  GROUP BY a.owner_id, account_type
)

SELECT owner_id, account_type, last_transaction_date, inactivity_days
FROM ranked_transactions
WHERE last_transaction_date <= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR) -- customers inactive for over a year
AND account_type IS NOT NULL
ORDER BY inactivity_days DESC;
