-- Databricks notebook source
-- MAGIC %md
-- MAGIC ### Create managed tables in the gold schema
-- MAGIC Join drivers and results tables to identify the number of wins per driver

-- COMMAND ----------

-- DROP TABLE IF EXISTS formula1_dev.gold.driver_wins;

CREATE TABLE IF NOT EXISTS formula1_dev.gold.driver_wins
AS 
SELECT d.name
       , count(1) AS number_of_wins
FROM formula1_dev.silver.drivers d
JOIN formula1_dev.silver.results r 
    ON (d.driver_id = r.driver_id)
WHERE r.position = 1
GROUP BY d.name;
