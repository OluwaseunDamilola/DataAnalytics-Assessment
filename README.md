Assessment Q1.sql

select * from (
SELECT 
    b.id AS owner_id, 
    COALESCE(b.first_name, b.last_name) AS name, 
    COUNT(DISTINCT CASE WHEN a.is_a_fund = 1 THEN a.owner_id END) AS investment_count,
    COUNT(DISTINCT CASE WHEN a.is_regular_savings = 1 THEN a.owner_id END) AS savings_count,
    SUM(c.confirmed_amount )/ 100 AS total_deposit
FROM users_customuser b
 JOIN plans_plan a 
ON b.id = a.owner_id 
 JOIN savings_savingsaccount c 
ON b.id = c.owner_id 
WHERE a.id IS NOT NULL AND c.id IS NOT NULL 
GROUP BY b.id, COALESCE(b.first_name, b.last_name)
having (sum(confirmed_amount) - sum(deduction_amount)) > 0
) a
where investment_count > 0 and savings_count > 0
