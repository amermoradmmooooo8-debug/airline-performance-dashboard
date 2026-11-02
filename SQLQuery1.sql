use Airline_flights
select * from airlines_flights_data

-- 1) Average, lowest, and highest ticket price

SELECT
AVG(CAST(price AS DECIMAL(10,2))) AS avg_price,
MIN(price) AS min_price,
MAX(price) AS max_price
FROM airlines_flights_data 

-- 2) The most expensive and cheapest airlines in terms of average price

SELECT
airline,
COUNT(*) AS total_flights,
AVG(CAST(price AS DECIMAL(10,2))) AS avg_price
FROM airlines_flights_data 
GROUP BY airline
ORDER BY avg_price DESC

-- 3) Average price by travel class

SELECT
class,
COUNT(*) AS total_flights,
AVG(CAST(price AS DECIMAL(10,2))) AS avg_price
FROM airlines_flights_data
GROUP BY class
ORDER BY avg_price DESC

-- 4) Longest and shortest trips by duration
SELECT TOP 10
airline,
source_city,
destination_city,
duration,
price
FROM airlines_flights_data
ORDER BY duration DESC

-- 5) The airlines with the most flights
SELECT
airline,
COUNT(*) AS total_flights,
AVG(CAST(price AS DECIMAL(10,2))) AS avg_price
FROM airlines_flights_data
GROUP BY airline
ORDER BY total_flights DESC

-- 6) The most expensive airlines between cities

SELECT
source_city,
destination_city,
COUNT(*) AS total_flights,
AVG(CAST(price AS DECIMAL(10,2))) AS avg_price
FROM airlines_flights_data
GROUP BY source_city, destination_city
ORDER BY avg_price DESC

-- 7) Available trips

select DISTINCT
source_city , 
destination_city 
from airlines_flights_data

-- 8) Non-stop trips

SELECT *
FROM airlines_flights_data
WHERE stops = 'zero'

-- 9) Number of flights for each airline

SELECT
airline,
COUNT(*) AS total_flights
FROM airlines_flights_data
GROUP BY airline
ORDER BY total_flights DESC

