-- Finding top 5 offices that have the most sales this month
SELECT office_id, COUNT(*) AS sales_count
FROM Houses
WHERE status = 'Sold' AND strftime('%Y', sale_date) = '2023' AND strftime('%m', sale_date) = '04'
GROUP BY office_id
ORDER BY sales_count DESC
LIMIT 5;

-- Finding top 5 estate angents that sold the most for this month
-- (with their contact information as well)
SELECT  EstateAgents.agent_id, EstateAgents.name, EstateAgents.phone, EstateAgents.email, SUM(sale_price) AS total_earned
FROM Houses
INNER JOIN EstateAgents ON Houses.sell_agent_id = EstateAgents.agent_id
WHERE Houses.status = 'Sold' AND strftime('%Y', Houses.sale_date) = '2023' AND strftime('%m', Houses.sale_date) = '04'
GROUP BY Houses.sell_agent_id
ORDER BY total_earned DESC
LIMIT 5;

-- Creating a table that will later store agents' comissions
CREATE TABLE AgentCommissions (
  agent_id INT PRIMARY KEY,
  total_commission DECIMAL(10,2),
  FOREIGN KEY (agent_id) REFERENCES EstateAgents(agent_id)
);

-- Calculating comissions for each of the houses, depending on their price
INSERT INTO AgentCommissions (agent_id, total_commission)
SELECT sell_agent_id, SUM(sale_price * commission_percentage) AS total_commission
FROM (
  SELECT sell_agent_id, sale_price,
  CASE
    WHEN sale_price < 100000 THEN 0.1
    WHEN sale_price BETWEEN 100000 AND 200000 THEN 0.075
    WHEN sale_price BETWEEN 200000 AND 500000 THEN 0.06
    WHEN sale_price BETWEEN 500000 AND 1000000 THEN 0.05
    ELSE 0.04
  END AS commission_percentage
  FROM Houses
) AS commissions
GROUP BY sell_agent_id;

-- Displaying AgentCommissions table
SELECT * from AgentCommissions;

-- Finding the average number of days a house that was sold this month was on the market
SELECT AVG(julianday(sale_date) - julianday(list_date)) AS avg_days_on_market
FROM Houses
WHERE status = 'Sold' AND strftime('%Y', Houses.sale_date) = '2023' AND strftime('%m', Houses.sale_date) = '04';

-- Finding average selling price for the houses that were sold this month
SELECT AVG(sale_price) AS avg_selling_price
FROM Houses
WHERE status = 'Sold' AND strftime('%Y', Houses.sale_date) = '2023' AND strftime('%m', Houses.sale_date) = '04';