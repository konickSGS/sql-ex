INSERT INTO PC (code, model, speed, ram, hd, cd, price)
SELECT
 model + (SELECT MAX(code) FROM PC) AS code,
 model,
 (SELECT MAX(speed) FROM PC) AS speed,
 (SELECT MAX(ram) FROM PC) AS ram,
 (SELECT MAX(hd) FROM PC) AS hd,
 CAST((SELECT MAX(CAST (SUBSTRING(cd,1,LEN(cd) - 1) AS int)) FROM PC) AS VARCHAR) + 'x' AS cd,
 (SELECT AVG(price) FROM PC) AS price
FROM Product
WHERE
 type = 'PC' AND
 model not IN (SELECT model FROM pc);