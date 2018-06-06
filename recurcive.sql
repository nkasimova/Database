CREATE TABLE t( 
id int, 
parent_id int 
);

INSERT INTO t VALUES (1, 0); 
INSERT INTO t VALUES (2, 1); 
INSERT INTO t VALUES (3, 1); 
INSERT INTO t VALUES (4, 1); 
INSERT INTO t VALUES (5, 1); 
INSERT INTO t VALUES (6, 1); 
INSERT INTO t VALUES (7, 2); 
INSERT INTO t VALUES (8, 2); 
INSERT INTO t VALUES (9, 3); 
INSERT INTO t VALUES (10, 4); 
INSERT INTO t VALUES (11, 5); 
INSERT INTO t VALUES (12, 6); 
INSERT INTO t VALUES (13, 6); 
INSERT INTO t VALUES (14, 5); 
INSERT INTO t VALUES (15, 14); 
INSERT INTO t VALUES (9, 8); 
INSERT INTO t VALUES (3, 4); 
INSERT INTO t VALUES (3, 10); 
INSERT INTO t VALUES (4, 15); 

WITH r (id, parent_id, lvl) AS( 
SELECT id, parent_id, 1 AS lvl
FROM t WHERE parent_id = 1 
UNION ALL 
SELECT t.id, t.parent_id, r.lvl + 1 
FROM t 
INNER JOIN r 
ON t.parent_id = r.id 
) 
SELECT DISTINCT id
FROM r
WHERE lvl = 2;

DROP TABLE t
