CREATE DATABASE pandemic;
USE pandemic;
SELECT DISTINCT Entity, Code FROM infectious_cases;
SELECT count(Entity) From infectious_cases group by Entity;