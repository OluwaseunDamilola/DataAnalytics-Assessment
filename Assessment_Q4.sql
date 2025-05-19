SELECT u.id AS customer_id,
  COALESCE(u.first_name,  u.last_name) AS name,
  TIMESTAMPDIFF(MONTH, u.date_joined, CURRENT_DATE) AS tenure_months, -- Calculating how long the customer has been active (in months)
  COUNT(s.id) AS total_transactions,
  ROUND((COUNT(s.id) / TIMESTAMPDIFF(MONTH, u.date_joined, CURRENT_DATE)) * 12 * 0.001 * AVG(s.available_returns) / 100, 2) AS estimated_clv
    -- CLV formula:
    -- (total transactions / tenure) * 12 * avg_profit_per_transaction
    -- where profit per transaction is 0.1% (0.001) of transaction value
    -- available_returns is divided by 100 to convert kobo to naira
FROM users_customuser u
LEFT JOIN savings_savingsaccount s ON u.id = s.owner_id
WHERE u.date_joined IS NOT NULL
GROUP BY u.id, name, tenure_months
ORDER BY estimated_clv DESC;
