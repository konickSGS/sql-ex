# Сумма баллов выполненных заданий: 44


## Задание: 1 (Serge I: 2002-09-30)
Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
 
#### Количество баллов за задачу: 1
```
SELECT
    model,
    speed,
    hd
FROM PC
WHERE price < 500;
```
## Задание: 2 (Serge I: 2002-09-21)
Найдите производителей принтеров. Вывести: maker
 
#### Количество баллов за задачу: 1
```
SELECT DISTINCT
 maker
FROM Product
WHERE type = 'Printer';
```
## Задание: 3 (Serge I: 2002-09-30)
Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
 
#### Количество баллов за задачу: 1
```
SELECT
 model,
 ram,
 screen
FROM Laptop
WHERE price > 1000;
```
## Задание: 4 (Serge I: 2002-09-21)
Найдите все записи таблицы Printer для цветных принтеров.
 
#### Количество баллов за задачу: 1
```
SELECT
 *
FROM Printer
WHERE color = 'y';
```
## Задание: 5 (Serge I: 2002-09-30)
Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
 
#### Количество баллов за задачу: 1
```
SELECT
 model,
 speed,
 hd
FROM PC
WHERE
 cd IN ('12x', '24x') AND
 price < 600;
```
## Задание: 6 (Serge I: 2002-10-28)
Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
 
#### Количество баллов за задачу: 2
```
SELECT DISTINCT
 maker, speed
FROM Product
JOIN Laptop ON Product.model = Laptop.model
WHERE
 type = 'Laptop' AND
 hd >= 10;
```
## Задание: 7 (Serge I: 2002-11-02)
Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
 
#### Количество баллов за задачу: 2
```
SELECT DISTINCT
 Product.model,
 price
FROM PC
JOIN Product ON Product.model = PC.model
WHERE maker = 'B'
UNION
SELECT DISTINCT
 Product.model,
 price
FROM Laptop
JOIN Product ON Product.model = Laptop.model
WHERE maker = 'B'
UNION
SELECT DISTINCT
 Product.model,
 price
FROM Printer
JOIN Product ON Product.model = Printer.model
WHERE maker = 'B';
```
## Задание: 8 (Serge I: 2003-02-03)
Найдите производителя, выпускающего ПК, но не ПК-блокноты.
 
#### Количество баллов за задачу: 2
```
SELECT
 maker
FROM Product
WHERE type = 'PC'
EXCEPT
SELECT
 maker
FROM Product
WHERE type = 'Laptop';
```
## Задание: 9 (Serge I: 2002-11-02)
Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
 
#### Количество баллов за задачу: 1
```
SELECT DISTINCT
 maker
FROM Product
JOIN PC ON Product.model = PC.model
WHERE speed >= 450;
```
## Задание: 10 (Serge I: 2002-09-23)
Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
 
#### Количество баллов за задачу: 1
```
SELECT
 model,
 price
FROM Printer
WHERE price  = (
 SELECT
  MAX(price)
 FROM Printer
);
```
## Задание: 11 (Serge I: 2002-11-02)
Найдите среднюю скорость ПК.
 
#### Количество баллов за задачу: 1
```
SELECT
 AVG(speed)
FROM PC;
```
## Задание: 12 (Serge I: 2002-11-02)
Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
 
#### Количество баллов за задачу: 1
```
SELECT
 AVG(speed)
FROM Laptop
WHERE price > 1000;
```
## Задание: 13 (Serge I: 2002-11-02)
Найдите среднюю скорость ПК, выпущенных производителем A.
 
#### Количество баллов за задачу: 1
```
SELECT
 AVG(speed)
FROM PC
JOIN Product ON PC.model = Product.model
WHERE maker = 'A';
```
## Задание: 15 (Serge I: 2003-02-03)
Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
 
#### Количество баллов за задачу: 2
```
SELECT
 hd
FROM PC
GROUP BY hd
HAVING COUNT(hd) > 1;
```
## Задание: 16 (Serge I: 2003-02-03)
Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
 
#### Количество баллов за задачу: 2
```
SELECT DISTINCT
 pc1.model,
 pc2.model,
 pc1.speed,
 pc1.ram
FROM PC as pc1
JOIN PC as pc2 ON
 pc1.speed = pc2.speed AND
 pc1.ram = pc2.ram
WHERE
 pc1.model > pc2.model;
```
## Задание: 17 (Serge I: 2003-02-03)
Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed
 
#### Количество баллов за задачу: 2
```
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
```
## Задание: 18 (Serge I: 2003-02-03)
Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
 
#### Количество баллов за задачу: 2
```
SELECT DISTINCT
 maker,
 price
FROM Printer
JOIN Product ON Printer.model = Product.model
WHERE
 color = 'y' AND
 price = (
  SELECT
   MIN(price)
  FROM Printer
  WHERE color = 'y'
 );
```
## Задание: 19 (Serge I: 2003-02-13)
Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
Вывести: maker, средний размер экрана.
 
#### Количество баллов за задачу: 1
```
SELECT
 maker,
 AVG(screen)
FROM Product
JOIN Laptop ON Product.model = Laptop.model
GROUP BY maker;
```
## Задание: 20 (Serge I: 2003-02-13)
Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.
 
#### Количество баллов за задачу: 2
```
SELECT
 maker,
 COUNT(*)
FROM Product
WHERE type = 'PC'
GROUP BY maker
HAVING COUNT(*) >= 3;
```
## Задание: 21 (Serge I: 2003-02-13)
Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена.
 
#### Количество баллов за задачу: 1
```
SELECT
 maker,
 MAX(price)
FROM PC
JOIN Product ON Product.model = PC.model
GROUP BY maker;
```
## Задание: 22 (Serge I: 2003-02-13)
Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.
 
#### Количество баллов за задачу: 1
```
SELECT
 speed,
 AVG(price)
FROM PC
WHERE speed > 600
GROUP BY speed;
```
## Задание: 23 (Serge I: 2003-02-14)
Найдите производителей, которые производили бы как ПК
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
Вывести: Maker
 
#### Количество баллов за задачу: 2
```
SELECT
 maker
FROM Product
JOIN PC ON Product.model = PC.model
WHERE speed >= 750 
INTERSECT
SELECT
 maker
FROM Product
JOIN Laptop ON Product.model = Laptop.model
WHERE speed >= 750;
```
## Задание: 24 (Serge I: 2003-02-03)
Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.
 
#### Количество баллов за задачу: 2
```
WITH all_prices as (
 SELECT
  model,
  price
 FROM PC
 UNION
 SELECT
  model,
  price
 FROM Laptop
 UNION
 SELECT
  model,
  price
 FROM Printer
)
SELECT
 Product.model
FROM Product
JOIN all_prices ON Product.model = all_prices.model
WHERE price = (
 SELECT
  MAX(price)
 FROM all_prices
);
```
## Задание: 25 (Serge I: 2003-02-14)
Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker
 
#### Количество баллов за задачу: 2
```
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
```
## Задание: 26 (Serge I: 2003-02-14)
Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.
 
#### Количество баллов за задачу: 2
```
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
```
## Задание: 27 (Serge I: 2003-02-03)
Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.
 
#### Количество баллов за задачу: 2
```
SELECT
 maker,
 AVG(hd)
FROM PC
JOIN Product ON PC.model = Product.model
WHERE maker IN (SELECT maker FROM Product WHERE type = 'Printer')
GROUP BY maker;
```
## Задание: 28 (Serge I: 2012-05-04)
Используя таблицу Product, определить количество производителей, выпускающих по одной модели.
 
#### Количество баллов за задачу: 2
```
SELECT
 COUNT(*)
FROM (
 SELECT
  maker
 FROM Product
 GROUP BY maker
 HAVING COUNT(model) = 1
) as maker_one_model_count;
```
## Задание: 97 (qwrqwr: 2013-02-15)
Отобрать из таблицы Laptop те строки, для которых выполняется следующее условие:
значения из столбцов speed, ram, price, screen возможно расположить таким образом, что каждое последующее значение будет превосходить предыдущее в 2 раза или более.
Замечание: все известные характеристики ноутбуков больше нуля.
Вывод: code, speed, ram, price, screen. 
#### Количество баллов за задачу: 3
```
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
```