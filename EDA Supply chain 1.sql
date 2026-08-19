use rohit_supply_chain;

Select count(*) from  supplychain ; 

Select distinct `Category Name` from supplychain;

Select distinct `Department` from products;
Select distinct `Customer Country` from supplychain ;
Select distinct `Shipping Mode` from supplychain ;
Select distinct `Delivery Status` from supplychain ;

select sum(`Customer City` IS Null ) as Missing_city
from supplychain ;

SELECT *
FROM supplychain
WHERE `Customer City`='';

select `Order Id`, 
Count(*)
from supplychain
group by `Order Id`
having count(*) >1;

SELECT *
FROM supplychain
WHERE Sales <0; 

SELECT *
FROM supplychain
WHERE `Order Profit Per Order`<0;


SELECT *
FROM supplychain
WHERE `shipping date (DateOrders)` < `order date (DateOrders)` ;


Select Sum(`Sales`) as total_sales
from supplychain;

Select avg(`Sales`) as avg_total_sales
from supplychain ;

Select max(`Sales`) as Max_Total_Sales
from supplychain;

Select min(`Sales`) as Min_Total_Sales
from supplychain;

SELECT
`Category Name`,
COUNT(*)
FROM supplychain
GROUP BY `Category Name`;


SELECT
`Category Name`,
Sum(`Sales`) 
FROM supplychain
GROUP BY `Category Name`;

Select  `Product Name`,
count(`Order Id`) as total_orders
from supplychain
group by `Product Name`
order by total_orders desc;

Select `Product Name` ,
sum(`Sales`) as High_sale,
min(`Order Item Quantity`*`Product Price`) as low_profit
from supplychain
group by `Product Name`
order by low_profit asc ;

Select `Product Name` ,
sum(`Sales`) as High_sale,
sum(`Order Profit Per Order`) as profit
from supplychain
group by `Product Name`
order by profit asc ; 

Select `Customer city` , 
sum( `Sales`)
from supplychain
group by `Customer city` ;

Select `Customer State` , 
sum( `Sales`)
from supplychain
group by `Customer State` ;

Select `Customer State` , 
sum(`Order Profit Per Order`) as low_profit
from supplychain
group by `Customer State`
order by low_profit ;

Select `Category Name`,
sum(`Sales`) as total_sales,
sum(`Order Profit Per Order`) as low_profit_product_category 
from supplychain
group by `Category Name`
order by low_profit_product_category  ;

Select  `Product Name`, `Order Status`,
Sum(`Sales`) as Total_Sales
from supplychain
group by  `Product Name`, `Order Status`;



SELECT
    `Product Name`,
    COUNT(`Order Id`) AS Total_Orders,
    SUM(`Sales`) AS Total_Sales,
    SUM(`Order Profit Per Order`) AS Total_Profit
FROM supplychain
GROUP BY `Product Name`
HAVING
    SUM(`Order Profit Per Order`) < 0
    AND COUNT(`Order Id`) < 10
ORDER BY Total_Profit ASC;


Select `Shipping Mode`,
count(` Order Id`) as total_orders
from supplychain
group by `Shipping Mode`
order by total_orders desc;
