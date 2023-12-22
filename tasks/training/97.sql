WITH values_table AS (
-- Эта таблица объединяет все значения как value, а также сохраняет их code
 SELECT
  speed as value,
  code,
  'speed' as type
 FROM Laptop
 UNION ALL
 SELECT
  ram,
  code,
  'ram'
 FROM Laptop
 UNION ALL
 SELECT
  price,
  code,
  'price'
 FROM Laptop
 UNION ALL
 SELECT
  screen,
  code,
  'screen'
 FROM Laptop
)
SELECT
 Laptop.code,
 speed,
 ram,
 price,
 screen
FROM Laptop
JOIN (
 -- Таблица, которая выводит необходимые code
 SELECT DISTINCT
  code
 FROM (
  -- Таблица с оконной функцией, которая сравнивает текущую value и предыдущую
  SELECT
   value,
   code,
   -- Оконная функция, которая сравнивает текущее значение с его предыдущим. Делит их
   -- По условию, нам нужно >= 2
   value / COALESCE(LAG(value) OVER(PARTITION BY code ORDER BY value), 0.1) AS div
  FROM values_table
 ) as lag_table
 WHERE div >= 2
 GROUP BY code
 -- Так как нам нужно, чтобы все значения определенного code соответствовали, то их кол-во должно быть 4
 HAVING COUNT(code) = 4
) AS code_table ON code_table.code = Laptop.code;