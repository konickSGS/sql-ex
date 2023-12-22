SELECT DISTINCT
 'Laptop' as type,
 model,
 speed
FROM Laptop
WHERE speed < (
 SELECT
  MIN(speed)
 FROM PC
);