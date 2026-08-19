SELECT
    `Shipping Mode`,
    COUNT(*) AS Total_Orders
FROM supplychain
GROUP BY `Shipping Mode`
ORDER BY Total_Orders DESC;

SELECT
    `Shipping Mode`,
    COUNT(*) AS Total_Orders,
    SUM(`Late_delivery_risk`) AS Late_Deliveries,
    ROUND(
        SUM(`Late_delivery_risk`) * 100.0 / COUNT(*),
        2
    ) AS Late_Delivery_Rate
FROM supplychain
GROUP BY `Shipping Mode`
ORDER BY Late_Delivery_Rate DESC;

SELECT
    `Shipping Mode`,
    COUNT(*) AS Total_Orders,
    SUM(`Late_delivery_risk`) AS Late_Deliveries,
    ROUND(
        SUM(`Late_delivery_risk`) * 100.0 / COUNT(*),
        2
    ) AS Late_Delivery_Rate
FROM  supplychain
GROUP BY `Shipping Mode`
ORDER BY Late_Delivery_Rate ASC;

SELECT
    `Shipping Mode`,
    COUNT(*) AS Total_Orders,
    ROUND(AVG(`Days for shipping (real)`), 2) AS Avg_Delivery_Days
FROM supplychain
GROUP BY `Shipping Mode`
ORDER BY Avg_Delivery_Days DESC;


select
`Shipping Mode`,
count(distinct `Order Id`) as Total_Orders,
round(Sum(`Sales`),2) as Highest_Revenue
from supplychain
group by `Shipping Mode`
order by Highest_Revenue Desc;

select
`Shipping Mode`,
count(distinct `Order Id`) as Total_Orders,
round(Sum(`Order Profit Per Order`),2) as Highest_Profit,
round(Sum(`Sales`),2) as Highest_Revenue
from supplychain
group by `Shipping Mode`
order by Highest_Profit Desc;