use rohit_supplychain; 

Select `Product Card Id`,`Product Name`,
Sum(`Sales`) as Total_Sales ,
sum(`Order Profit Per Order`) as total_profit
from supplychain
group by  `Product Card Id`,`Product Name`
order by Total_Sales ,total_profit desc 
limit 5 ;



SELECT
    `Product Card Id`,
    `Product Name`,
    ROUND(SUM(Sales),2) AS Total_Revenue
FROM supplychain
GROUP BY
    `Product Card Id`,
    `Product Name`
ORDER BY Total_Revenue DESC
LIMIT 5;

SELECT
    `Product Card Id`,
    `Product Name`,
    SUM(`Order Item Quantity`) AS Total_Quantity_Sold
FROM supplychain
GROUP BY
    `Product Card Id`,
    `Product Name`
ORDER BY Total_Quantity_Sold DESC
LIMIT 10; 

SELECT
    `Product Card Id`,
    `Product Name`,
    ROUND(SUM(Sales),2) AS Total_Revenue,

    DENSE_RANK() OVER(
        ORDER BY SUM(Sales) DESC
    ) AS Product_Rank

FROM supplychain
GROUP BY
    `Product Card Id`,
    `Product Name`;

SELECT
    `Product Card Id`,
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Total_Revenue
FROM supplychain
GROUP BY
    `Product Card Id`,
    `Product Name`
ORDER BY Total_Revenue ASC
LIMIT 10;

WITH ProductSales AS (
    SELECT
        `Product Card Id`,
        `Product Name`,
        SUM(Sales) AS Total_Sales
    FROM supplychain
    GROUP BY
        `Product Card Id`,
        `Product Name`
),

ABC AS (
    SELECT
        *,
        SUM(Total_Sales) OVER (ORDER BY Total_Sales DESC) AS Running_Sales,
        SUM(Total_Sales) OVER () AS Grand_Total
    FROM ProductSales
)

SELECT
    `Product Card Id`,
    `Product Name`,
    ROUND(Total_Sales,2) AS Total_Sales,

    ROUND(
        Running_Sales * 100.0 / Grand_Total,
        2
    ) AS Cumulative_Percentage,

    CASE
        WHEN Running_Sales * 100.0 / Grand_Total <= 80 THEN 'A'
        WHEN Running_Sales * 100.0 / Grand_Total <= 95 THEN 'B'
        ELSE 'C'
    END AS ABC_Category

FROM ABC
ORDER BY Total_Sales DESC;

WITH ProductSales AS
(
SELECT
    `Product Card Id`,
    `Product Name`,
    SUM(Sales) AS Total_Sales
FROM supplychain
GROUP BY
    `Product Card Id`,
    `Product Name`
),

Pareto AS
(
SELECT
    *,
    SUM(Total_Sales) OVER(
        ORDER BY Total_Sales DESC
    ) AS Running_Total,

    SUM(Total_Sales) OVER() AS Grand_Total

FROM ProductSales
)

SELECT
    `Product Card Id`,
    `Product Name`,
    ROUND(Total_Sales,2) AS Total_Sales,

    ROUND(
        Running_Total*100/Grand_Total,
        2
    ) AS Cumulative_Percentage

FROM Pareto
ORDER BY Total_Sales DESC;

SELECT
    `Product Card Id`,
    `Product Name`,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(`Order Profit Per Order`),2) AS Total_Profit
FROM supplychain
GROUP BY
    `Product Card Id`,
    `Product Name`
ORDER BY
    Total_Sales DESC,
    Total_Profit ASC;
    
    SELECT
    `Product Card Id`,
    `Product Name`,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(`Order Profit Per Order`),2) AS Total_Profit
FROM supplychain
GROUP BY
    `Product Card Id`,
    `Product Name`
ORDER BY
     Total_Profit desc,
    Total_Sales asc;
    
    
    SELECT
    `Product Card Id`,
    `Product Name`,
    ROUND(SUM(Sales),2) AS Total_Sales,

    DENSE_RANK() OVER(
        ORDER BY SUM(Sales) DESC
    ) AS Product_Rank

FROM supplychain
GROUP BY
    `Product Card Id`,
    `Product Name`
ORDER BY Product_Rank;

SELECT
    `Category Name`,
    
    ROUND(SUM(Sales),2) AS Total_Sales,

    DENSE_RANK() OVER(
        ORDER BY SUM(Sales) DESC
    ) AS Category_Rank

FROM supplychain
GROUP BY
`Category Name`
order by Category_Rank;


SELECT
    `Product Card Id`,
    `Product Name`,

    ROUND(SUM(`Sales`),2) AS Total_Sales,

    ROUND(SUM(`Order Profit Per Order`),2) AS Total_Profit,

    ROUND(
        (SUM(`Order Profit Per Order`) / SUM(`Sales`)) * 100,
        2
    ) AS Profit_Margin_Percentage

FROM supplychain
GROUP BY
    `Product Card Id`,
    `Product Name`
ORDER BY Profit_Margin_Percentage DESC;


SELECT
    `Product Card Id`,
    `Product Name`,
    SUM(`Order Item Quantity`) AS Total_Quantity_Sold
FROM supplychain
GROUP BY
    `Product Card Id`,
    `Product Name`
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;

SELECT
    `Order Region`,
    SUM(`Order Profit Per Order`) AS Total_Profit
FROM supplychain

GROUP BY `Order Region`
ORDER BY Total_Profit DESC;