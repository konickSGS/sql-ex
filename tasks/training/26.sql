SELECT
 AVG(price)
FROM (
 SELECT
  price
 FROM PC
 JOIN Product ON Product.model = PC.model
 WHERE maker = 'A'
 UNION ALL
 SELECT
  price
 FROM Laptop
 JOIN Product ON Product.model = Laptop.model
 WHERE maker = 'A'
) PC_Laptop_table;