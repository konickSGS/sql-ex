SELECT
 maker,
 MAX(price)
FROM PC
JOIN Product ON Product.model = PC.model
GROUP BY maker;