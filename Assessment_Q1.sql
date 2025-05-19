SELECT * FROM 
  (
    SELECT b.id AS owner_id,
        COALESCE(b.first_name, b.last_name) AS name,
        COUNT(DISTINCT CASE WHEN a.is_a_fund = 1 THEN a.owner_id END) AS investment_count, -- Count distinct owner id where fund is 1
        COUNT(DISTINCT CASE WHEN a.is_regular_savings = 1 THEN a.owner_id END) AS savings_count, --Count distinct owner id where saving is 1
        SUM(c.confirmed_amount )/ 100 AS total_deposit -- Divided confirmed amount by 100 to convert back to naira
    FROM users_customuser b
    JOIN plans_plan a
    ON b.id = a.owner_id
    JOIN savings_savingsaccount c
    ON b.id = c.owner_id
    WHERE a.id IS NOT NULL AND c.id IS NOT NULL
    GROUP BY b.id, COALESCE(b.first_name, b.last_name)
    HAVING (sum(confirmed_amount) - sum(deduction_amount)) > 0 -- check if the account was funded
  ) a
WHERE investment_count > 0 AND savings_count > 0
ORDER BY total_deposit;
