/*
				You are tasked with creating an advanced banking system that includes various types of accounts, such 
				as savings and current accounts. The system should support account creation, deposits, withdrawals, and 
				interest calculations. 
*/

USE master;
GO
EXEC sp_renamedb 'Banking_Sys', 'HMBank';
GO
/*EXEC statement in SQL Server is used to execute a stored procedure or a dynamically constructed SQL statement.
It is often used to invoke a stored procedure and run the code it contains.*/
/*
Database Tables 
1. Customers: 
• customer_id (Primary Key) 
• first_name 
• last_name 
• DOB (Date of Birth) 
• email 
• phone_number
• address 
2. Accounts: 
• account_id (Primary Key) 
• customer_id (Foreign Key) 
• account_type (e.g., savings, current, zero_balance) 
• balance 
3. Transactions: 
• transaction_id (Primary Key) 
• account_id (Foreign Key) 
• transaction_type (e.g., deposit, withdrawal, transfer) 
• amount 
• transaction_date 
*/
-------------------    Tasks 1: Database Design
/*
-- 1. Create the database named "HMBank" 
CREATE DATABASE HMBank;
-- 2. Define the schema for the Customers, Accounts, and Transactions tables based on the provided schema.  
-- 3. Create an ERD (Entity Relationship Diagram) for the database.  
-- 4. Create appropriate Primary Key and Foreign Key constraints for referential integrity.  
-- 5. Write SQL scripts to create the mentioned tables with appropriate data types, constraints, and relationships.   
	• Customers  
	• Accounts 
	• Transactions 
*/
CREATE TABLE Customers (
	customer_id INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	DOB DATE,
	email VARCHAR(50),
	phone_number VARCHAR(50),
	address VARCHAR(100)
);

CREATE TABLE Accounts (
	account_id INT PRIMARY KEY,
	customer_id INT,
	account_type VARCHAR(50),
	balance DECIMAL(10, 2),
	FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Transactions (
	transaction_id INT PRIMARY KEY,
	account_id INT,
	transaction_type VARCHAR(50),
	amount DECIMAL(10, 2),
	transaction_date DATE,
	FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM Transactions;


-------------------    Tasks 2: Select, Where, Between, AND, LIKE: 


-- 1. Insert at least 10 sample records into each of the following tables.   
--	• Customers  
--	• Accounts 
--	• Transactions 

-- Insert sample records into Customers table
INSERT INTO Customers (customer_id, first_name, last_name, DOB, email, phone_number, address)
VALUES
  (1, 'Ravi', 'Kumar', '1990-05-15', 'ravi.kumar@email.com', '9876543210', 'Chennai, Tamil Nadu'),
  (2, 'Deepa', 'Suresh', '1985-08-22', 'deepa.suresh@email.com', '8765432109', 'Bangalore, Karnataka'),
  (3, 'Gopal', 'Nair', '1988-03-10', 'gopal.nair@email.com', '7654321098', 'Hyderabad, Telangana'),
  (4, 'Shalini', 'Raj', '1992-11-30', 'shalini.raj@email.com', '6543210987', 'Kochi, Kerala'),
  (5, 'Karthik', 'Menon', '1987-06-25', 'karthik.menon@email.com', '9432109876', 'Coimbatore, Tamil Nadu'),
  (6, 'Anjali', 'Prasad', '1995-04-18', 'anjali.prasad@email.com', '8321098765', 'Mysuru, Karnataka'),
  (7, 'Vijay', 'Rao', '1989-09-08', 'vijay.rao@email.com', '7210987654', 'Visakhapatnam, Andhra Pradesh'),
  (8, 'Sneha', 'Sharma', '1993-07-12', 'sneha.sharma@email.com', '6109876543', 'Thiruvananthapuram, Kerala'),
  (9, 'Harish', 'Naidu', '1986-01-05', 'harish.naidu@email.com', '9098765432', 'Bengaluru, Karnataka'),
  (10, 'Meera', 'Sundaram', '1991-12-03', 'meera.sundaram@email.com', '9876543210', 'Chennai, Tamil Nadu'),
  (11, 'Arun', 'Menon', '1984-02-28', 'arun.menon@email.com', '8765432109', 'Kochi, Kerala'),
  (12, 'Divya', 'Prakash', '1994-10-20', 'divya.prakash@email.com', '7654321098', 'Coimbatore, Tamil Nadu'),
  (13, 'Rajesh', 'Iyer', '1988-07-15', 'rajesh.iyer@email.com', '6543210987', 'Hyderabad, Telangana'),
  (14, 'Sangeeta', 'Raj', '1993-04-22', 'sangeeta.raj@email.com', '7432109876', 'Bengaluru, Karnataka'),
  (15, 'Sanjay', 'Shetty', '1986-11-08', 'sanjay.shetty@email.com', '8321098765', 'Mangalore, Karnataka');

  -- Insert sample records into Accounts table
INSERT INTO Accounts (account_id, customer_id, account_type, balance)
VALUES
  (101, 1, 'savings', 50000.00),
  (102, 2, 'current', 100000.00),
  (103, 3, 'zero_balance', 75000.00),
  (104, 4, 'savings', 30000.00),
  (105, 5, 'current', 150000.00),
  (106, 6, 'zero_balance', 50000.00),
  (107, 7, 'savings', 80000.00),
  (108, 8, 'current', 120000.00),
  (109, 9, 'zero_balance', 90000.00),
  (110, 10, 'savings', 60000.00),
  (111, 11, 'current', 110000.00),
  (112, 12, 'zero_balance', 45000.00),
  (113, 13, 'savings', 75000.00),
  (114, 14, 'current', 95000.00),
  (115, 15, 'zero_balance', 70000.00),
  (116, 1, 'savings', 65000.00),
  (117, 2, 'current', 125000.00),
  (118, 3, 'zero_balance', 90000.00),
  (119, 4, 'savings', 38000.00),
  (120, 5, 'current', 160000.00),
  (121, 6, 'zero_balance', 52000.00),
  (122, 7, 'savings', 85000.00),
  (123, 8, 'current', 130000.00),
  (124, 9, 'zero_balance', 95000.00),
  (125, 10, 'savings', 70000.00),
  (126, 11, 'current', 115000.00),
  (127, 12, 'zero_balance', 48000.00),
  (128, 13, 'savings', 78000.00),
  (129, 14, 'current', 100000.00),
  (130, 15, 'zero_balance', 0.00),
  (131, 1, 'current', 75000.00),
  (132, 2, 'savings', 110000.00),
  (133, 3, 'savings', 60000.00);

-- Insert sample records into Transactions table
INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES
  (1001, 101, 'deposit', 20000.00, '2023-01-15'),
  (1002, 102, 'withdrawal', 5000.00, '2023-02-20'),
  (1003, 103, 'deposit', 10000.00, '2023-03-10'),
  (1004, 104, 'withdrawal', 7000.00, '2023-04-05'),
  (1005, 105, 'deposit', 25000.00, '2023-05-22'),
  (1006, 106, 'withdrawal', 12000.00, '2023-06-15'),
  (1007, 107, 'deposit', 18000.00, '2023-07-01'),
  (1008, 108, 'withdrawal', 8000.00, '2023-08-18'),
  (1009, 109, 'deposit', 22000.00, '2023-09-05'),
  (1010, 110, 'withdrawal', 15000.00, '2023-10-12'),
  (1011, 111, 'deposit', 12000.00, '2023-11-20'),
  (1012, 112, 'withdrawal', 3000.00, '2023-12-08'),
  (1013, 113, 'deposit', 16000.00, '2023-12-15'),
  (1014, 114, 'withdrawal', 11000.00, '2023-12-15'),
  (1015, 115, 'deposit', 8000.00, '2023-12-30'),
  (1016, 116, 'withdrawal', 5000.00, '2023-12-31'),
  (1017, 117, 'deposit', 30000.00, '2023-12-15'),
  (1018, 118, 'withdrawal', 10000.00, '2023-12-31'),
  (1019, 119, 'deposit', 25000.00, '2023-12-31'),
  (1020, 120, 'withdrawal', 7000.00, '2023-12-31'),
  (1021, 121, 'deposit', 15000.00, '2023-01-05'),
  (1022, 106, 'withdrawal', 8000.00, '2023-02-10'),
  (1023, 123, 'deposit', 20000.00, '2023-03-15'),
  (1024, 124, 'withdrawal', 9000.00, '2023-04-20'),
  (1025, 125, 'deposit', 18000.00, '2023-05-25'),
  (1026, 126, 'withdrawal', 7000.00, '2023-06-30'),
  (1027, 101, 'deposit', 25000.00, '2023-07-05'),
  (1028, 128, 'withdrawal', 12000.00, '2023-08-10'),
  (1029, 101, 'deposit', 30000.00, '2023-09-15'),
  (1030, 130, 'withdrawal', 11000.00, '2023-10-20'),
  (1031, 131, 'deposit', 12000.00, '2023-11-25'),
  (1032, 132, 'withdrawal', 5000.00, '2023-12-01'),
  (1033, 130, 'deposit', 18000.00, '2023-12-06'),
  (1034, 115, 'withdrawal', 10000.00, '2023-12-11'),
  (1035, 121, 'deposit', 22000.00, '2023-12-16'),
  (1036, 125, 'withdrawal', 7000.00, '2023-12-21'),
  (1037, 114, 'deposit', 15000.00, '2023-12-26'),
  (1038, 105, 'withdrawal', 8000.00, '2023-12-15');

--------------------------------------------Write SQL queries for the following tasks:--------------------------------------------- 

-- 1. Write a SQL query to retrieve the name, account type and email of all customers.

SELECT DISTINCT CONCAT(first_name,' ',last_name) AS Name, email,A.account_type FROM Customers C
JOIN Accounts A ON C.customer_id=A.customer_id;

-- 2. Write a SQL query to list all transaction corresponding customer.
SELECT DISTINCT CONCAT(C.first_name,' ',C.last_name),T.* FROM Transactions T
JOIN Accounts A ON T.account_id=A.account_id
JOIN Customers C ON A.customer_id=C.customer_id;

-- 3. Write a SQL query to increase the balance of a specific account by a certain amount.
UPDATE Accounts
SET balance=balance+10000 WHERE account_id=108;

-- 4. Write a SQL query to Combine first and last names of customers as a full_name. 
SELECT CONCAT(first_name,' ',last_name) AS full_name FROM Customers;

-- 5. Write a SQL query to remove accounts with a balance of zero where the account type is savings.
DELETE FROM Accounts WHERE balance = 0 AND account_type = 'savings';

-- 6. Write a SQL query to Find customers living in a specific city. 
SELECT * FROM Customers WHERE address LIKE '%Bengaluru%';

-- 7. Write a SQL query to Get the account balance for a specific account.
SELECT balance FROM Accounts WHERE account_type='savings'; --account_id=

-- 8. Write a SQL query to List all current accounts with a balance greater than $1,000.
SELECT * FROM Accounts WHERE account_type='current' AND balance>50000;

-- 9. Write a SQL query to Retrieve all transactions for a specific account.
SELECT transaction_type,amount,transaction_date FROM Transactions WHERE account_id=101;

-- 10. Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate. 

ALTER TABLE Accounts
ADD interest AS (CASE WHEN account_type = 'savings' THEN balance * 0.04 ELSE 0 END);
SELECT CAST(interest AS FLOAT) FROM Accounts;																							--	--doubt
SELECT account_id,balance,interest, balance * (interest/12)*12*(6/12) AS interest_accrued FROM Accounts
WHERE account_type = 'savings';

--Interest Accrued=Principal×( InterestRate/ Number of Compounding Periods)×Number of Compounding Periods × Time/Total Compounding Periods in a Year

-- 11. Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit. 
SELECT account_id, balance FROM Accounts WHERE balance < 5000;

-- 12. Write a SQL query to Find customers not living in a specific city. 
SELECT * FROM Customers WHERE address NOT LIKE '%Bengaluru%';


SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM Transactions;


-----------------------------------  Tasks 3: Aggregate functions, Having, Order By, GroupBy and Joins: ---------------------------


-- 1. Write a SQL query to Find the average account balance for all customers.
SELECT AVG(balance) AS average_balance FROM Accounts;

-- 2. Write a SQL query to Retrieve the top 10 highest account balances.  
SELECT TOP 10 account_id, balance FROM Accounts ORDER BY balance DESC;

-- 3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.
SELECT COUNT(*),SUM(amount) AS total_deposits FROM Transactions WHERE transaction_type = 'deposit' AND transaction_date = '2023-12-15';

-- 4. Write a SQL query to Find the Oldest and Newest Customers.
WITH RankedCustomers AS (
SELECT customer_id,first_name,last_name, DOB,(SELECT MIN(DOB) FROM Customers) AS OldestDOB,(SELECT MAX(DOB) FROM Customers) AS NewestDOB
FROM Customers)
SELECT * FROM RankedCustomers WHERE DOB = OldestDOB OR DOB = NewestDOB;

WITH RankedCustomers AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY DOB ASC) AS Oldest, ROW_NUMBER() OVER (ORDER BY DOB DESC) AS Newest FROM Customers)
SELECT * FROM RankedCustomers WHERE Oldest = 1 OR Newest = 1;

-- 5. Write a SQL query to Retrieve transaction details along with the account type. 
SELECT T.*,A.account_type FROM Transactions T
JOIN Accounts A ON T.account_id = A.account_id;

-- 6. Write a SQL query to Get a list of customers along with their account details.
SELECT CONCAT(C.first_name, ' ', C.last_name) AS full_name,
       (SELECT TOP 1 account_id FROM Accounts A WHERE A.customer_id = C.customer_id) AS account_id,
       (SELECT TOP 1 account_type FROM Accounts A WHERE A.customer_id = C.customer_id) AS account_type,
       (SELECT TOP 1 balance FROM Accounts A WHERE A.customer_id = C.customer_id) AS balance
FROM Customers C;


-- 7. Write a SQL query to Retrieve transaction details along with customer information for a specific account.
SELECT DISTINCT C.*,T.* FROM Accounts A
JOIN Customers C ON A.customer_id=C.customer_id
JOIN Transactions T ON A.account_id=T.account_id WHERE A.account_id=115;

-- 8. Write a SQL query to Identify customers who have more than one account. 
SELECT customer_id,COUNT(account_id) AS No_ofAccounts FROM Accounts
GROUP BY customer_id HAVING COUNT(account_id)>1;

-- 9. Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals. 
SELECT account_id, SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE 0 END) -
SUM(CASE WHEN transaction_type = 'withdrawal' THEN amount ELSE 0 END) AS difference
FROM Transactions GROUP BY account_id;

-- 10. Write a SQL query to Calculate the average daily balance for each account over a specified period. 
SELECT A.account_id, AVG(balance) AS average_daily_balance FROM Accounts A
JOIN Transactions ON Transactions.account_id=A.account_id
WHERE transaction_date BETWEEN '2023-01-15' AND '2023-07-01'
GROUP BY A.account_id;

-- 11. Calculate the total balance for each account type.
SELECT account_type, SUM(balance) AS total_balance FROM Accounts GROUP BY account_type;

-- 12. Identify accounts with the highest number of transactions order by descending order.
SELECT A.account_id, COUNT(T.transaction_id) AS transaction_count FROM Accounts A
JOIN Transactions T ON A.account_id = T.account_id
GROUP BY A.account_id
ORDER BY transaction_count DESC;

-- 13. List customers with high aggregate account balances, along with their account types.
SELECT C.customer_id, CONCAT(C.first_name, ' ', C.last_name) AS full_name, A.account_type, SUM(A.balance) AS total_balance
FROM Customers C
JOIN Accounts A ON C.customer_id = A.customer_id
GROUP BY C.customer_id, CONCAT(C.first_name, ' ', C.last_name), A.account_type
ORDER BY total_balance DESC;

-- 14. Identify and list duplicate transactions based on transaction amount, date, and account. 
SELECT amount, transaction_date, account_id, COUNT(*) AS duplicate_count FROM Transactions
GROUP BY amount, transaction_date, account_id HAVING COUNT(*) > 1;

SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM Transactions;


----------------------- --------------   Tasks 4: Subquery and its type: -----------------------------------------


-- 1. Retrieve the customer(s) with the highest account balance. 

SELECT TOP 1 customer_id,balance FROM Accounts ORDER BY balance DESC;
SELECT customer_id,balance FROM Accounts WHERE balance = (SELECT MAX(balance) FROM Accounts);

-- 2. Calculate the average account balance for customers who have more than one account. 

SELECT AVG(balance) AS AvgBalance FROM Accounts WHERE customer_id IN (
SELECT customer_id FROM Accounts GROUP BY customer_id HAVING COUNT(*) > 1);

-- 3. Retrieve accounts with transactions whose amounts exceed the average transaction amount. 

SELECT account_id,amount FROM Transactions WHERE amount > (SELECT AVG(amount) FROM Transactions);

-- 4. Identify customers who have no recorded transactions. 

SELECT A.account_id,CONCAT(C.first_name,' ',C.last_name) AS full_name ,C.customer_id, A.Balance FROM Accounts A
JOIN Customers C ON A.customer_id = C.customer_id
WHERE NOT EXISTS ( SELECT 1 FROM Transactions T WHERE T.account_id = A.account_id);

--SELECT 1 is a shorthand way to indicate that we are only checking for the existence of at least one row that satisfies the condition in the WHERE clause of the subquery.

-- 5. Calculate the total balance of accounts with no recorded transactions. 

SELECT SUM(A.balance) AS Total_balance FROM Accounts A
WHERE NOT EXISTS ( SELECT 1 FROM Transactions T WHERE T.account_id = A.account_id);

/*SELECT A.account_id,C.customer_id, A.Balance FROM Accounts A
JOIN Customers C ON A.customer_id = C.customer_id
WHERE NOT EXISTS ( SELECT 1 FROM Transactions T WHERE T.account_id = A.account_id);*/

SELECT * FROM Transactions;

-- 6. Retrieve transactions for accounts with the lowest balance. 

SELECT TOP 6 T.*,A.balance FROM Transactions T
JOIN Accounts A ON T.account_id = A.account_id ORDER BY A.Balance;

-- 7. Identify customers who have accounts of multiple types. 

SELECT customer_id,COUNT(DISTINCT account_type) AS No_ofAccounts FROM Accounts
GROUP BY customer_id HAVING COUNT(DISTINCT account_type)>1;

/*SELECT customer_id, COUNT(DISTINCT account_type) AS No_ofAccounts FROM Accounts
WHERE customer_id IN (SELECT customer_id FROM Accounts GROUP BY customer_id HAVING COUNT(DISTINCT account_type) > 1)
GROUP BY customer_id;*/

-- 8. Calculate the percentage of each account type out of the total number of accounts.

SELECT account_type, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Accounts) AS Percentage FROM Accounts
GROUP BY account_type;

-- 9. Retrieve all transactions for a customer with a given customer_id. 

SELECT * FROM Transactions WHERE account_id IN (SELECT account_id FROM Accounts WHERE customer_id = 1);

-- 10. Calculate the total balance for each account type, including a subquery within the SELECT clause. 

SELECT account_type, (SELECT SUM(balance) FROM Accounts WHERE account_type = A.account_type) AS TotalBalance FROM Accounts A
GROUP BY account_type;

SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM Transactions;