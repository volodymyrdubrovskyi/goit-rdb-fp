SELECT 
    e.Entity,
    AVG(c.Number_rabies) AS avg_rabies,
    MIN(c.Number_rabies) AS min_rabies,
    MAX(c.Number_rabies) AS max_rabies,
    SUM(c.Number_rabies) AS sum_rabies
FROM cases AS c
LEFT JOIN entities AS e ON c.Entity_id = e.Entity_id
WHERE Number_rabies IS NOT NULL
GROUP BY Entity
ORDER BY avg_rabies DESC
LIMIT 10;