CREATE TABLE IF NOT EXISTS pizza_sales_report(
  pizza_id INT NOT NULL,
  order_id INT NOT NULL,
  pizza_name_id varchar(50),
  quantity INT NOT NULL,
  order_date DATETIME,
  order_time time,
  unit_price decimal(2,2),
  total_price decimal(3,2),
  pizza_size varchar(20),
  pizza_category varchar(20)
);


LOAD DATA INFILE '/home/smita/Desktop/Data Analysis/Projects/Pizza_Sale_Analysis/pizza_sales.csv'
INTO TABLE pizza_sales_report
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SELECT * FROM pizza_sales_report;


--Total Revenue
 SELECT SUM(total_price) 
   AS Total_Revenue 
 FROM pizza_sales_report;


--Average Order value
SELECT SUM(total_price)/COUNT(DISTINCT order_id) 
  AS Avg_order_value 
FROM pizza_sales_report;


--Total Pizza Sale
SELECT SUM(quantity) 
  AS Total_pizza_sold 
FROM pizza_sales_report;


--Total Order
  SELECT 
    COUNT(DISTINCT order_id) 
  FROM pizza_sales_report;


--Average Pizza Per Order
SELECT 
  SUM(quantity) / COUNT(DISTINCT order_id) Avg_Pizza_Per_Order 
FROM pizza_sales_report;
