DROP FUNCTION IF EXISTS CalculateDeltaYear;

DELIMITER //

CREATE FUNCTION CalculateDeltaYear(input_year INT)
RETURNS INT
READS SQL DATA
BEGIN
    RETURN YEAR(CURDATE()) - YEAR(DATE(CONCAT(input_year, '-01-01')));
END //

DELIMITER ;

SELECT case_id, Year, CalculateDeltaYear(Year) AS Delta_Year
FROM cases;