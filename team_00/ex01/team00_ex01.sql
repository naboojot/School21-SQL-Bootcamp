SELECT * FROM tours
WHERE total_cost = (
  SELECT MIN(total_cost)
  FROM tours
) 
UNION 
SELECT * FROM tours
WHERE total_cost = (
  SELECT MAX(total_cost)
  FROM tours
) 
ORDER BY total_cost, tour;
