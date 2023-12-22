SELECT
 maker,
 AVG(hd)
FROM PC
JOIN Product ON PC.model = Product.model
WHERE maker IN (SELECT maker FROM Product WHERE type = 'Printer')
GROUP BY maker;