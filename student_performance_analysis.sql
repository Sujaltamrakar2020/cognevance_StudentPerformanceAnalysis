CREATE DATABASE student_analysis;
USE student_analysis;

CREATE TABLE student_performance (
    Student_ID VARCHAR(20) PRIMARY KEY,
    Department VARCHAR(20),
    Gender VARCHAR(10),
    Study_Hours_Per_Day DECIMAL(4,1),
    Attendance_Percent DECIMAL(5,1),
    Assignment_Score DECIMAL(5,1),
    Midterm_Score DECIMAL(5,1),
    Final_Exam_Score DECIMAL(5,1),
    Overall_Score DECIMAL(5,1),
    Grade VARCHAR(2),
    Result VARCHAR(10)
);

-- After importing student_performance_data.csv, run:

SELECT COUNT(*) AS total_students
FROM student_performance;

SELECT
    Department,
    ROUND(AVG(Overall_Score), 2) AS avg_score,
    ROUND(AVG(Attendance_Percent), 2) AS avg_attendance,
    ROUND(100 * SUM(Result = 'Pass') / COUNT(*), 2) AS pass_rate
FROM student_performance
GROUP BY Department
ORDER BY avg_score DESC;

SELECT Grade, COUNT(*) AS students
FROM student_performance
GROUP BY Grade
ORDER BY FIELD(Grade, 'A','B','C','D','F');

SELECT
    CASE
        WHEN Attendance_Percent < 60 THEN 'Below 60%'
        WHEN Attendance_Percent <= 75 THEN '60-75%'
        WHEN Attendance_Percent <= 90 THEN '76-90%'
        ELSE '91-100%'
    END AS attendance_band,
    COUNT(*) AS students,
    ROUND(AVG(Overall_Score), 2) AS avg_score
FROM student_performance
GROUP BY attendance_band
ORDER BY avg_score DESC;
