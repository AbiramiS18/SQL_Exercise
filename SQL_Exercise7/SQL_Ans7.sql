-- 7.1 Who receieved a 1.5kg package?
SELECT c.name FROM Client c JOIN 
Package p on c.accountnumber = p.recipient
WHERE p.weight = 1.5;

-- 7.2 What is the total weight of all the packages that he sent?
SELECT SUM(weight)  FROM package
WHERE Sender = 
(SELECT Recipient FROM Package WHERE weight = 1.5);