SELECT * FROM `blinkit grocery data`;

SELECT CAST(SUM(`Sales`)/ 1000000 AS DECIMAL(10,2)) AS `Total_Sales_Millions`
FROM `blinkit grocery data`
WHERE `Outlet Establishment Year` = 2022;

SELECT CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales FROM `blinkit grocery data`
WHERE `Outlet Establishment Year` = 2022;

SELECT COUNT(*) AS No_Of_Items FROM `blinkit grocery data`
WHERE `Outlet Establishment Year` = 2022;

SELECT CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating FROM `blinkit grocery data`;

SELECT `Item Fat Content`, 
         CAST(SUM(`Sales`)/1000 AS DECIMAL(10,2)) AS Total_Sales_Thousands,
         CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales ,
         COUNT(*) AS No_Of_Items,
         CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM `blinkit grocery data`
GROUP BY `Item Fat Content` 
ORDER BY Total_Sales_Thousands DESC;

SELECT `Item Type`, 
         CAST(SUM(`Sales`) AS DECIMAL(10,2)) AS Total_Sales,
         CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales ,
         COUNT(*) AS No_Of_Items,
         CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM `blinkit grocery data`
GROUP BY `Item Type` 
ORDER BY Total_Sales ASC
LIMIT 5;

SELECT `Outlet Location Type`, `Item Fat Content`,
         CAST(SUM(`Sales`) AS DECIMAL(10,2)) AS Total_Sales
FROM `blinkit grocery data`
GROUP BY `Outlet Location Type`, `Item Fat Content` 
ORDER BY Total_Sales ASC;

SET SQL_SAFE_UPDATES = 0;
USE blinkit_database;
SELECT `Outlet Location Type`, 
       CAST(SUM(CASE WHEN `Item Fat Content` = 'Low Fat' THEN `Sales` ELSE 0 END) AS DECIMAL(10,2)) AS Low_Fat, 
       CAST(SUM(CASE WHEN `Item Fat Content` = 'Regular' THEN `Sales` ELSE 0 END) AS DECIMAL(10,2)) AS Regular
FROM `blinkit grocery data`
GROUP BY `Outlet Location Type`
ORDER BY `Outlet Location Type`;

SELECT `Outlet Establishment Year`, 
		 CAST(SUM(`Sales`) AS DECIMAL(10,2)) AS Total_Sales,
         CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales,
		 COUNT(*) AS No_Of_Items,
         CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM `blinkit grocery data`
GROUP BY `Outlet Establishment Year`
ORDER BY `Total_Sales` DESC

SELECT  `Outlet Size`, 
    CAST(SUM(`Sales`) AS DECIMAL(10,2)) AS Total_Sales,
    CAST((SUM(`Sales`) * 100.0 / (SELECT SUM(`Sales`) FROM `blinkit grocery data`)) AS DECIMAL(10,2)) AS Sales_Percentage
FROM `blinkit grocery data`
GROUP BY `Outlet Size`
ORDER BY Total_Sales DESC;

SELECT `Outlet Location Type`, 
		 CAST(SUM(`Sales`) AS DECIMAL(10,2)) AS Total_Sales,
         CAST((SUM(`Sales`) * 100.0 / (SELECT SUM(`Sales`) FROM `blinkit grocery data`)) AS DECIMAL(10,2)) AS Sales_Percentage,
         CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales,
		 COUNT(*) AS No_Of_Items,
         CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM `blinkit grocery data`
WHERE `Outlet Establishment Year` = 2020
GROUP BY `Outlet Location Type`
ORDER BY `Total_Sales` DESC

SELECT `Outlet Type`, 
		 CAST(SUM(`Sales`) AS DECIMAL(10,2)) AS Total_Sales,
         CAST((SUM(`Sales`) * 100.0 / (SELECT SUM(`Sales`) FROM `blinkit grocery data`)) AS DECIMAL(10,2)) AS Sales_Percentage,
         CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales,
		 COUNT(*) AS No_Of_Items,
         CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM `blinkit grocery data`
GROUP BY `Outlet Type`
ORDER BY `Total_Sales` DESC