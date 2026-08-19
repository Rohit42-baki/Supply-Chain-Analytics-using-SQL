use rohit_supplychain;


SELECT
    `Customer Id`,
    COUNT(DISTINCT `Order Id`) AS Total_Orders
FROM supplychain
GROUP BY `Customer Id`
HAVING COUNT(DISTINCT `Order Id`) > 1
ORDER BY Total_Orders DESC;

SELECT
    ROUND(
        (
            COUNT(CASE WHEN Order_Count > 1 THEN 1 END)
            * 100.0
            / COUNT(*)
        ),
        2
    ) AS Repeat_Purchase_Rate
FROM (
    SELECT
        `Customer Id`,
        COUNT(DISTINCT `Order Id`) AS Order_Count
    FROM supplychain
    GROUP BY `Customer Id`
) AS CustomerOrders;

SELECT
    `Customer Id`,
    CONCAT(`Customer Fname`,' ',`Customer Lname`) AS Customer_Name,
    COUNT(DISTINCT `Order Id`) AS Total_Orders,
    ROUND(SUM(	`Sales`),2) AS Total_Revenue
FROM supplychain
GROUP BY
    `Customer Id`,
    `Customer Fname`,
    `Customer Lname`
ORDER BY Total_Revenue DESC;

SELECT
    `Customer Id`,
    MAX(`order date (DateOrders)`) AS Last_Purchase_Date,
    COUNT(DISTINCT `Order Id`) AS Frequency,
    ROUND(SUM(`Sales`),2) AS Monetary
FROM supplychain
GROUP BY `Customer Id`;

SELECT
    `Customer Id`,
    CONCAT(`Customer Fname`, ' ', `Customer Lname`) AS Customer_Name,
    ROUND(SUM(Sales),2) AS Total_Revenue
FROM supplychain
GROUP BY
    `Customer Id`,
    `Customer Fname`,
    `Customer Lname`
ORDER BY Total_Revenue DESC
LIMIT 10;


SELECT
    `Customer Id`,
    CONCAT(`Customer Fname`, ' ', `Customer Lname`) AS Customer_Name,
    ROUND(SUM(`Benefit per order`),2) AS Total_Profit
FROM supplychain
GROUP BY
    `Customer Id`,
    `Customer Fname`,
    `Customer Lname`
ORDER BY Total_Profit DESC
LIMIT 10;

SELECT
    `Customer Id`,
    CONCAT(`Customer Fname`, ' ', `Customer Lname`) AS Customer_Name,
    COUNT(DISTINCT `Order Id`) AS Total_Orders
FROM supplychain
GROUP BY
    `Customer Id`,
    `Customer Fname`,
    `Customer Lname`
ORDER BY Total_Orders DESC
LIMIT 10;

SELECT
    `Customer Id`,
    CONCAT(`Customer Fname`, ' ', `Customer Lname`) AS Customer_Name,
    ROUND(SUM(Sales),2) AS Total_Revenue,

    DENSE_RANK() OVER(
        ORDER BY SUM(Sales) DESC
    ) AS Customer_Rank

FROM supplychain
GROUP BY
    `Customer Id`,
    `Customer Fname`,
    `Customer Lname`;
    

SELECT
    `Customer Id`,
    CONCAT(`Customer Fname`, ' ', `Customer Lname`) AS Customer_Name,
    MAX(`order date (DateOrders)`) AS Last_Purchase_Date,
    DATEDIFF(
        (SELECT MAX(`order date (DateOrders)`) FROM supplychain),
        MAX(`order date (DateOrders)`)
    ) AS Days_Inactive
FROM supplychain
GROUP BY
    `Customer Id`,
    `Customer Fname`,
    `Customer Lname`
ORDER BY Days_Inactive DESC;

SELECT
    ROUND(AVG(Total_Orders),2) AS Average_Orders_Per_Customer
FROM (
    SELECT
        `Customer Id`,
        COUNT(DISTINCT `Order Id`) AS Total_Orders
    FROM supplychain
    GROUP BY `Customer Id`
) AS CustomerOrders;



SELECT
    ROUND(AVG(Customer_Revenue),2) AS Average_Revenue_Per_Customer
FROM (
    SELECT
        `Customer Id`,
        SUM(Sales) AS Customer_Revenue
    FROM supplychain
    GROUP BY `Customer Id`
) AS CustomerRevenue;


SELECT
    `Customer Country`,
    COUNT(DISTINCT `Customer Id`) AS Total_Customers
FROM supplychain
GROUP BY `Customer Country`
ORDER BY Total_Customers DESC;

SELECT
    `Customer Country`,
    COUNT(DISTINCT `Customer Id`) AS Total_Customers,
    ROUND(
        COUNT(DISTINCT `Customer Id`) * 100.0 /
        (SELECT COUNT(DISTINCT `Customer Id`) FROM supplychain),
        2
    ) AS Percentage
FROM supplychain
GROUP BY `Customer Country`
ORDER BY Total_Customers DESC;

SELECT
    `Market`,
    COUNT(DISTINCT `Customer Id`) AS Total_Customers
FROM supplychain
GROUP BY `Market`
ORDER BY Total_Customers DESC;

SELECT
    Market,
    COUNT(DISTINCT `Customer Id`) AS Total_Customers,

    ROUND(
        COUNT(DISTINCT `Customer Id`) * 100.0 /
        (SELECT COUNT(DISTINCT `Customer Id`) FROM supplychain),
        2
    ) AS Market_Share_Percentage

FROM supplychain
GROUP BY Market
ORDER BY Market_Share_Percentage DESC;