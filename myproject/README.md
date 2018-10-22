# End-to-End MySQL Database Creation and Analysis


## Selecting a data set that is already normalized 
To select the data set I went to [Relational Dataset Repository](https://relational.fit.cvut.cz) and selected the CCS dataset. The CCS dataset contained Transactional data from Czech debit card company specializing on payments at petrol pumps.


## Creating the database / Importing the data set and schema
### Attempt 1:
Created an external connection in MySQLWorkbench using the following credentials:
``` 
hostname: relational.fit.cvut.cz
port: 3306
username: guest
password: relational
```
With the MySQL connection ready, I tried to export the data, using the following:
```
Server > Data Export 
```
Unfortunately, for me and all my classmates, this operation failed. 

### Attempt 2:
I then tried to export the data using SequelPro, to do this, I created an external connection as well. Then I proceeded to export the data as SQL dump and saved it locally. I went back to MySQL and open my local connection. I created a new Schema and tried to export the data, it failed again.

### Attempt 3:
The last solution was to do it through the terminal. First, I created a new Schema “CCS” in my local connection. 

In the terminal I executed the following command to export the database: 
```
mysqldump --column-statistics=0 -u guest -p -h relational.fit.cvut.cz ccs ccs.sql 
```
With the database exported, I executed the following command to import:
```
File > Open SQL Script 
```
This action created the Schema and imported the dataset.


## Generating the ERD
I generated the ERD using the following: 
```
Database > Reverse Engineering 
```
![ERD](lab-mysql/myproject/ERD_ccs.png) 


## Joins
### Inner Join
For the inner join I decided to work with the 'customers' and 'yearmonth' tables and used the 'Segment' and 'Consumption' Columns to further understand the spending patterns by type of customer.
```
SELECT customers.Segment, yearmonth.Consumption
FROM customers
INNER JOIN yearmonth
ON customers.CustomerID = yearmonth.CustomerID;
```
### Right Join
For the Right join I decided to work with the 'gasstations' and 'transactions_1k' tables and used the 'ChainID,'ProductID', and 'TransactionID' to better understand which products were more popular in which chains.
```
SELECT gasstations.ChainID, transactions_1k.ProductID, transactions_1k.TransactionID
FROM gasstations 
RIGHT JOIN transactions_1k
ON transactions_1k.GasStationID = gasstations.GasStationID;
```


## Queries
### Query 1
I executed this query to understand which Chains were the most popular among the customers. To do so, I grouped the number of transactions by each chain. From the results, I can conlude that chain 4, 2, 1, and 33 are the most popular. I created a temporary table to further analyze the results.
```
CREATE TEMPORARY TABLE CCS.transactions_by_chain
SELECT gasstations.ChainID, COUNT(transactions_1k.TransactionID) AS "Transactions by Chain" 
FROM gasstations
INNER JOIN transactions_1k
ON transactions_1k.GasStationID = gasstations.GasStationID
GROUP BY gasstations.ChainID; 
```

### Query 2 
I executed this query in order to better understand the differences in consumption patters between the different customer segments. From the results, I can see that the KAM segment average consumption is of 20.5, the LAM segment average consumption is of 19.92 and the SME segment average consumption is of 18. I used the Amounts data point since it is not affected by price.
```
SELECT Segment, Amounts/Transactions AS AvgTransaction
FROM (
    SELECT customers.Segment AS Segment, COUNT(transactions_1k.TransactionID) AS Transactions, SUM(transactions_1k.Amount) AS Amounts
    FROM customers
    INNER JOIN transactions_1k ON customers.CustomerID = transactions_1k.CustomerID
    GROUP BY customers.Segment
) summary;
```


## Query 3
I deleted this datapoint since it there was only one customer with a negative consumption value. 

```
DELETE FROM CCS.yearmonth
WHERE Consumption < 0;
```