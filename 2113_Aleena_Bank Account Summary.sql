CREATE TABLE BankAccount(AccountNumber INT NOT NULL, 
AccountHolderName VARCHAR(100) NOT NULL,
TransactionDate date NOT NULL,
TransactionType VARCHAR(50) NOT NULL,
TransactionAmount FLOAT NOT NULL);

INSERT INTO bankaccount VALUES(1001,'Ravi Sharma','2023-07-01','Deposit',5000.00),(1001,'Ravi Sharma','2023-07-05','Withdrawal',1000.00),(1001,'Ravi Sharma','2023-07-10','Deposit',2000.00),(1002,'Priya Gupta','2023-07-02','Deposit',3000.00),(1002,'Priya Gupta','2023-07-08','Withdrawal',500.00),(1003,'Vikram Patel','2023-07-04','Deposit',10000.00),(1003,'Vikram Patel','2023-07-09','Withdrawal',2000.00);

SELECT * FROM public.bankaccount;

SELECT accountnumber,accountholdername,
sum(CASE
WHEN TransactionType = 'Deposit' THEN TransactionAmount 
WHEN TransactionType = 'Withdrawal' THEN -TransactionAmount 
ELSE 0 
END) AS TotalBalance
FROM bankaccount
GROUP BY AccountNumber,accountholdername ORDER BY accountnumber ;