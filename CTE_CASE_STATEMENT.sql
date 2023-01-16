--USING CTE AND CASE STATEMENTS

-- classify the life expectancy into high, medium, and low. Name the new column as 'life_expectancy_category'
-- SELECT all the countries with the highest life expectancy

SELECT * from pg_catalog.pg_tables;
SELECT * from country;

WITH CTE_LIFE AS (
    SELECT
    name, continent, population, life_expectancy,
    (CASE WHEN life_expectancy > 79 then 'High'
    WHEN life_expectancy between 60 and 79 then 'Medium'
    ELSE 'Low'
    END) life_expectancy_category from country)

    SELECT
        name, life_expectancy, life_expectancy_category
        FROM 
        CTE_LIFE
        WHERE
            life_expectancy_category = 'High'
        ORDER BY life_expectancy desc;