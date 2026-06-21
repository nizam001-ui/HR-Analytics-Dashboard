
-- Attrition by Department?

SELECT 
    Department,
    COUNT(Employee_ID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(Employee_ID)) * 100, 2) AS Attrition_Rate
FROM hr_analytics_data
GROUP BY Department
ORDER BY Attrition_Rate DESC;

-- Why are employees leaving? 
SELECT 
    Reason_for_Leaving,
    COUNT(Employee_ID) AS Number_of_Employees
FROM hr_analytics_data
WHERE Attrition = 'Yes'
GROUP BY Reason_for_Leaving
ORDER BY Number_of_Employees DESC;

-- What are the yearly hiring trends?
SELECT 
    EXTRACT(YEAR FROM Hire_Date) AS Hiring_Year,
    COUNT(Employee_ID) AS Total_Hires
FROM hr_analytics_data
GROUP BY Hiring_Year
ORDER BY Hiring_Year ASC;