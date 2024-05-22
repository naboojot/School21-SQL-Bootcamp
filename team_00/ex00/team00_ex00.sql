CREATE TABLE node (
	point1 char, 
	point2 char, 
	cost int
);

INSERT INTO node
VALUES ('A', 'B', 10),
	   ('B', 'A', 10),
	   ('B', 'C', 35),
       ('C', 'B', 35),
	   ('C', 'D', 30),
	   ('D', 'C', 30),
	   ('A', 'C', 15),
	   ('C', 'A', 15),
	   ('A', 'D', 20),
	   ('D', 'A', 20),
	   ('B', 'D', 25),
	   ('D', 'B', 25);

CREATE VIEW tours AS (
	WITH RECURSIVE 
	nodes AS (
		SELECT point1::bpchar AS path, point1, point2, cost
		FROM node
		WHERE point1 = 'A'
		UNION ALL
		SELECT CONCAT(nodes.path, ',', node.point1) AS path,
			   node.point1, node.point2, node.cost + nodes.cost
		FROM nodes JOIN node
			ON nodes.point2 = node.point1
		WHERE path NOT LIKE CONCAT('%', node.point1, '%')
	),
	routes AS (
		SELECT cost AS total_cost, CONCAT('{', path, ',', point2, '}') AS tour
		FROM nodes
		WHERE LENGTH(path) = 7 AND point2 = 'A'
	)
	
	SELECT * FROM routes
);

SELECT * FROM tours
WHERE total_cost = (
  SELECT MIN(total_cost)
  FROM tours
) 
ORDER BY total_cost, tour;