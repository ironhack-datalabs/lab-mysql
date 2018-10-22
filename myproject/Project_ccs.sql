-- Inner Join
SELECT customers.Segment, yearmonth.Consumption
FROM customers
INNER JOIN yearmonth
ON customers.CustomerID = yearmonth.CustomerID;

-- Right Join 
SELECT gasstations.ChainID, transactions_1k.ProductID, transactions_1k.TransactionID
FROM gasstations 
RIGHT JOIN transactions_1k
ON transactions_1k.GasStationID = gasstations.GasStationID;

-- Query 1
SELECT gasstations.ChainID, COUNT(transactions_1k.TransactionID) AS "Transactions by Chain" 
FROM gasstations
INNER JOIN transactions_1k
ON transactions_1k.GasStationID = gasstations.GasStationID
GROUP BY gasstations.ChainID; 

-- Query 2
