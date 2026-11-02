SELECT TOP 100 *
FROM dbo.airlines_flights_data;
------------------------------------------------------------
SELECT
COUNT(*) AS Total_Rows
FROM dbo.airlines_flights_data;
--------------------------------------------------------------
--Query 1 — Total Flights and Average Price
SELECT
COUNT(*) AS Total_Flights,
AVG(CAST(price AS FLOAT)) AS Avg_Price
FROM airlines_flights_data;
-------------------------------------------------------------
--Query 2 — Average Ticket Price by Airline
SELECT airline,
AVG(CAST(price AS DECIMAL(18,2))) AS Avg_Price
FROM airlines_flights_data
GROUP BY airline
ORDER BY Avg_Price ASC;
----------------------------------------------------------------
--Query 3 — Top 5 Departure Cities
SELECT TOP 5 source_city,
COUNT(*) AS Total_Flights
FROM dbo.airlines_flights_data
GROUP BY source_city
ORDER BY Total_Flights DESC;
-----------------------------------------------------------------
--Query 4 — Business vs Economy Class
SELECT [class],
AVG(CAST(price AS DECIMAL(18,2))) AS Avg_Price
FROM dbo.airlines_flights_data
GROUP BY [class]
ORDER BY Avg_Price DESC;
------------------------------------------------------------------
-- Query 5- Airlines with High Average Prices
SELECT airline,
AVG(CAST(price AS DECIMAL(18,2))) AS Avg_Price
FROM dbo.airlines_flights_data
GROUP BY airline
HAVING AVG(CAST(price AS DECIMAL(18,2))) > 10000
ORDER BY Avg_Price DESC;
-----------------------------------------------------------------
-- Query 6- Airlines with High Average Prices
SELECT airline,
AVG(CAST(price AS DECIMAL(18,2))) AS Avg_Price
FROM dbo.airlines_flights_data
GROUP BY airline
HAVING AVG(CAST(price AS DECIMAL(18,2))) > 10000
ORDER BY Avg_Price DESC;
-----------------------------------------------------------------
-- Query 7- Average Flight Duration by 
SELECT airline,
ROUND(AVG(duration), 2) AS Avg_Duration
FROM dbo.airlines_flights_data
GROUP BY airline
ORDER BY Avg_Duration ASC;
-----------------------------------------------------------------
-- Query 8- Top 5 Most Common Flight Routes
SELECT TOP 5 source_city,destination_city,
COUNT(*) AS Total_Flights
FROM dbo.airlines_flights_data
GROUP BY source_city, destination_city
ORDER BY Total_Flights DESC;
----------------------------------------------------------------
-- Query 9- Average Ticket Price by Departure Time
SELECT departure_time,
AVG(CAST(price AS DECIMAL(18,2))) AS Avg_Price
FROM dbo.airlines_flights_data
GROUP BY departure_time
ORDER BY Avg_Price DESC;
----------------------------------------------------------------
-- Query 10- Airlines with More Than 10 Routes
SELECT airline,
COUNT(DISTINCT CONCAT(source_city, ' - ', destination_city)) AS Total_Routes
FROM dbo.airlines_flights_data
GROUP BY airline
HAVING COUNT(DISTINCT CONCAT(source_city, ' - ', destination_city)) > 10
ORDER BY Total_Routes DESC;
