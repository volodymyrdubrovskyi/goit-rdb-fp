SELECT 
    case_id, Year,
    DATE(CONCAT(Year, '-01-01')) AS Jan_Year,
    CURDATE() AS Cur_date,
    YEAR(CURDATE()) - YEAR(DATE(CONCAT(Year, '-01-01'))) AS Delta_Year
FROM cases;