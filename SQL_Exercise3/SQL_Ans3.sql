-- 3.1 Select all warehouses.
SELECT * FROM Warehouses;

-- 3.2 Select all boxes with a value larger than $150.
SELECT * FROM Boxes
WHERE value > 150;

-- 3.3 Select all distinct contents in all the boxes.
SELECT DISTINCT contents FROM Boxes;

-- 3.4 Select the average value of all the boxes.
SELECT AVG(value) FROM Boxes;

-- 3.5 Select the warehouse code and the average value of the boxes in each warehouse.
SELECT Warehouse,AVG(value) FROM Boxes
GROUP BY Warehouse;

-- 3.6 Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
SELECT Warehouse, AVG(Value) FROM Boxes
GROUP BY Warehouse HAVING AVG(Value)>150;

-- 3.7 Select the code of each box, along with the name of the city the box is located in.
SELECT b.code, w.Location FROM Boxes b JOIN
Warehouses w on b.warehouse = w.code;

-- 3.8
-- Select the warehouse codes, along with the number of boxes in each warehouse. 
-- Optionally, take into account that some warehouses are empty (i.e., the box count should show up as zero, instead of omitting the warehouse from the result).
SELECT Warehouse, count(Warehouse) FROM Boxes
GROUP BY Warehouse;

-- 3.9 Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).
SELECT Warehouse FROM (
SELECT b.Warehouse,count(b.Warehouse)>w.capacity sat FROM Boxes b JOIN
Warehouses w on b.warehouse = w.code
GROUP BY b.Warehouse) as t
WHERE sat =1;

-- 3.10 Select the codes of all the boxes located in Chicago.
SELECT w.code FROM Boxes b JOIN 
Warehouses w on b.warehouse = w.code
WHERE w.location = "Chicago"
GROUP BY w.code;

-- 3.11 Create a new warehouse in New York with a capacity for 3 boxes.
INSERT INTO Warehouses(code, location, capacity) VALUES (6, "New York",3);

-- 3.12 Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.
INSERT INTO Boxes(code, contents, value, Warehouse) VALUES ("H5RT", "Papers",200, 2);

-- 3.13 Reduce the value of all boxes by 15%.
UPDATE Boxes
SET value = 0.85*value;

-- 3.14 Remove all boxes with a value lower than $100.
DELETE FROM Boxes
WHERE Value <100;

-- 3.15 Remove all boxes from saturated warehouses.
DELETE FROM Boxes
WHERE Warehouse IN 
(SELECT Warehouse FROM (
SELECT b.Warehouse,count(b.Warehouse)>w.capacity sat FROM Boxes b JOIN
Warehouses w on b.warehouse = w.code
GROUP BY b.Warehouse) as t
WHERE sat =1);

-- 3.16 Add Index for column "Warehouse" in table "boxes"
CREATE INDEX Index_Warehouse ON Boxes(Warehouse);

-- 3.17 Print all the existing indexes
SHOW INDEX FROM Boxes FROM SQL_Exercise3;

-- 3.18 Remove (drop) the index you added just
DROP INDEX Index_Warehouse ON Boxes;



