-- Total Customers

SELECT COUNT(*) AS TotalCustomers
FROM CustomerChurn;

-- Churned Customers

SELECT COUNT(*) AS ChurnedCustomers
FROM CustomerChurn
WHERE Churn='Yes';

-- Churn Rate

SELECT
ROUND(
COUNT(CASE WHEN Churn='Yes' THEN 1 END)
*100.0/
COUNT(*)
,2)
AS ChurnRate
FROM CustomerChurn;

-- Churn By Region

SELECT
Region,
COUNT(*) AS ChurnCount
FROM CustomerChurn
WHERE Churn='Yes'
GROUP BY Region
ORDER BY ChurnCount DESC;

-- Revenue Lost

SELECT
SUM(MonthlyCharges)
AS RevenueLost
FROM CustomerChurn
WHERE Churn='Yes';

-- Churn By Contract

SELECT
ContractType,
COUNT(*) AS ChurnCount
FROM CustomerChurn
WHERE Churn='Yes'
GROUP BY ContractType;

-- Churn By Payment Method

SELECT
PaymentMethod,
COUNT(*) AS ChurnCount
FROM CustomerChurn
WHERE Churn='Yes'
GROUP BY PaymentMethod;

-- Customer Segmentation

SELECT
CASE
WHEN Age < 30 THEN 'Young'
WHEN Age <= 50 THEN 'Middle Age'
ELSE 'Senior'
END AS AgeGroup,
COUNT(*) AS CustomerCount
FROM CustomerChurn
GROUP BY
CASE
WHEN Age < 30 THEN 'Young'
WHEN Age <= 50 THEN 'Middle Age'
ELSE 'Senior'
END;

-- CTE Example

WITH ChurnCustomers AS
(
SELECT *
FROM CustomerChurn
WHERE Churn='Yes'
)

SELECT COUNT(*)
FROM ChurnCustomers;

-- Window Function

SELECT
CustomerID,
MonthlyCharges,
RANK() OVER
(
ORDER BY MonthlyCharges DESC
)
AS RevenueRank
FROM CustomerChurn;
