
"awsdatacatalog". "db-project". "fact_aggregated bookings";


-- Total Bookings
SELECT COUNT(*) as total_bookings
FROM "awsdatacatalog"."db-project"."fact_bookings";


-- Total capacity of rooms Present
SELECT SUM(capacity) as total_capacity
FROM "awsdatacatalog"."db-project"."fact_aggregated_bookings";


--Total Succesful Bookings
SELECT SUM(successful_bookings) as total_successful_bookings
FROM "awsdatacatalog"."db-project"."fact_aggregated_bookings";

--Occupancy %
WITH Occupancy AS (
	SELECT SUM(successful_bookings) as total_successful_bookings
	FROM "awsdatacatalog"."db-project"."fact_aggregated_bookings"
)
SELECT (total_successful_bookings * 100.0 / (SELECT SUM(capacity) as total_capacity
FROM "awsdatacatalog"."db-project"."fact_aggregated_bookings")) as Occupancy_percentage
FROM Occupancy;


-- Avg Ratings
SELECT AVG(ratings_given) as average_rating
FROM "awsdatacatalog"."db-project"."fact_bookings";



--No of days
SELECT COUNT(DISTINCT date) as total_days
FROM "awsdatacatalog"."db-project"."dim_date";



-- Total cancelled bookings
SELECT COUNT(*) as total_cancelled_bookings
FROM "awsdatacatalog"."db-project"."fact_bookings";
WHERE booking_status = 'Cancelled';




-- Cancellation %
WITH Cancellation AS (
	SELECT COUNT(*) as total_cancelled_bookings
	FROM "awsdatacatalog"."db-project"."fact_bookings"
	WHERE booking_status = 'Cancelled'
)
SELECT (total_cancelled_bookings * 100.0 / (SELECT COUNT(*) as total_bookings FROM "awsdatacatalog"."db-project"."fact_bookings")) as cancellation_percentage
FROM Cancellation;




--Total Checked Out
SELECT COUNT(*) as total_checked_out_bookings
FROM "awsdatacatalog"."db-project"."fact_bookings"
WHERE booking_status = 'Checked out';




--Total no show bookings
SELECT COUNT(*) as total_no_show_bookings
FROM "awsdatacatalog"."db-project"."fact_bookings"
WHERE booking_status = 'No Show';




--No Show rate %
WITH NoShow AS (
    SELECT COUNT(*) as total_no_show_bookings
    FROM "awsdatacatalog"."db-project"."fact_bookings"
    WHERE booking_status = 'No Show'
)
SELECT (total_no_show_bookings * 100.0) / (SELECT COUNT(*) as total_bookings FROM "awsdatacatalog"."db-project"."fact_bookings") as no_show_rate_percentage
FROM NoShow;




--Booking % by Platform
SELECT booking_platform, (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM "awsdatacatalog"."db-project"."fact_bookings") as booking_percentage
FROM "awsdatacatalog"."db-project"."fact_bookings"
GROUP BY booking_platform;




--Booking % by Room class
SELECT room_category, (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM "awsdatacatalog"."db-project"."fact_bookings") as booking_percentage
FROM "awsdatacatalog"."db-project"."fact_bookings"
GROUP BY room_category;



--ADR 
SELECT SUM(revenue_realized) / (SELECT COUNT(*) as total_bookings FROM "awsdatacatalog"."db-project"."fact_bookings") AS adr
FROM "awsdatacatalog"."db-project"."fact_bookings";



--Realisation %
WITH CheckedOut AS (
  SELECT COUNT(*) AS total_checked_out_bookings
  FROM "awsdatacatalog"."db-project"."fact_bookings"
  WHERE booking_status = 'Checked Out'
)
SELECT (total_checked_out_bookings * 100.0 / (SELECT COUNT(*) FROM "awsdatacatalog"."db-project"."fact_bookings")) AS realization_percentage
FROM CheckedOut;



--RevPAR
SELECT SUM(revenue_realized) / (SELECT SUM(capacity) as total_capacity FROM "awsdatacatalog"."db-project"."dim_date") AS revpar
FROM "awsdatacatalog"."db-project"."fact_bookings";



--DBRN
SELECT COUNT(*) / (SELECT COUNT(DISTINCT date) as total_days FROM "awsdatacatalog"."db-project"."dim_date") AS dbrn
FROM "awsdatacatalog"."db-project"."fact_bookings";



--DSRN 
WITH cte1 AS (
  SELECT SUM(capacity) as Total_capacity
  FROM "awsdatacatalog"."db-project"."fact_aggregated_bookings"
),
cte2 AS (
  SELECT COUNT(DISTINCT date) as total_days 
  FROM "awsdatacatalog"."db-project"."dim_date"
)
SELECT Total_capacity / total_days as DSRN
FROM cte1, cte2;




--DURN
WITH cte1 AS (
  SELECT COUNT(*) as total_checked_out_bookings
	FROM "awsdatacatalog"."db-project"."fact_bookings"
	WHERE booking_status = 'Checked out'
),
cte2 AS (
  SELECT COUNT(DISTINCT date) as total_days 
  FROM "awsdatacatalog"."db-project"."dim_date"
)
SELECT total_checked_out_bookings / total_days as DURN
FROM cte1, cte2;



