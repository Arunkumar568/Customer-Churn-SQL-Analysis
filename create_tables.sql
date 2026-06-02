CREATE TABLE CustomerChurn
(
    CustomerID INT PRIMARY KEY,
    Gender VARCHAR(10),
    Age INT,
    Region VARCHAR(50),
    Tenure INT,
    MonthlyCharges DECIMAL(10,2),
    ContractType VARCHAR(50),
    PaymentMethod VARCHAR(50),
    Churn VARCHAR(5)
);
