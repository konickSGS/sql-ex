WITH PC_ram_table AS (
 SELECT
  maker
 FROM Product
 JOIN PC ON PC.model = Product.model
 WHERE
  speed = (
   SELECT
    MAX(speed)
   FROM PC
   WHERE ram = (SELECT MIN(ram) FROM PC)
  ) 
  AND ram = (SELECT MIN(ram) FROM PC)
)
SELECT
 maker
FROM Product
WHERE type = 'Printer'
INTERSECT
SELECT
 *
FROM PC_ram_table;