-- 5.1 Select the name of all the pieces. 
SELECT name FROM pieces;

-- 5.2 Select all the providers' data. 
SELECT * FROM Providers;

-- 5.3 Obtain the average price of each piece (show only the piece code and the average price).
SELECT Piece, AVG(Price) FROM Provides
GROUP BY piece;

-- 5.4 Obtain the names of all providers who supply piece 1.
SELECT pd.name FROM Providers pd JOIN 
Provides ps on pd.code = ps.provider
WHERE ps.piece = 1;

-- 5.5 Select the name of pieces provided by provider with code "HAL".
SELECT p.name FROM Pieces P JOIN 
Provides Ps on p.code = ps.piece
WHERE ps.provider = "HAL";

-- 5.6 For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price 
SELECT p.name, pd.name, ps.price FROM Pieces p JOIN
Provides ps on p.code =ps.piece JOIN 
Providers pd on pd.code = ps.provider
WHERE ps.Price in
(SELECT max(price) FROM Provides,pieces
WHERE provides.Piece = pieces.code
GROUP BY piece);

-- 5.7 Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.
INSERT INTO Provides(piece,provider,price) VALUES (1,"TNBC",7);

-- 5.8 Increase all prices by one cent.
UPDATE Provides
SET price = price+1;

-- 5.9 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).
DELETE FROM Provides
WHERE provider = "RBT" and piece = 4;

-- 5.10 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces 
DELETE FROM Provides
WHERE provider = "RBT";



