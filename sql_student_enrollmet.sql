-- Total Revenue Verification
SELECT 
    SUM(AmountPaid) AS Total_Revenue
FROM factpayment;

-- Total Enrollments Verification

SELECT 
    COUNT(*) AS Total_Enrollments
FROM factenrollement;

-- Distinct Students Verification
SELECT 
    COUNT(DISTINCT StudentID) AS Total_Students
FROM factenrollement;

-- Revenue & Enrollments Breakdown by Branch
SELECT 
    b.BranchName,
    COUNT(e.EnrollmentID) AS Enrollments,
    SUM(p.AmountPaid) AS Revenue
FROM factenrollement e
JOIN dimbranch b ON e.BranchID = b.BranchID
LEFT JOIN factpayment p ON e.EnrollmentID = p.EnrollmentID
GROUP BY b.BranchName
ORDER BY Revenue DESC;

-- Count of Active vs Inactive Students
SELECT 
    Status,
    COUNT(StudentID) AS Student_Count
FROM dimstudent
GROUP BY Status;

-- Revenue Breakdown by Student Gender
SELECT 
    s.Gender,
    COUNT(DISTINCT s.StudentID) AS Total_Students,
    SUM(p.AmountPaid) AS Total_Revenue
FROM dimstudent s
JOIN factenrollement e ON s.StudentID = e.StudentID
JOIN factpayment p ON e.EnrollmentID = p.EnrollmentID
GROUP BY s.Gender;

-- Top Performing Courses by Revenue & Enrollment Count
SELECT 
    c.CourseName,
    c.Category,
    COUNT(e.EnrollmentID) AS SQL_Enrollment_Count,
    SUM(p.AmountPaid) AS Total_Revenue
FROM dimcourse c
JOIN factenrollement e ON c.CourseID = e.CourseID
LEFT JOIN factpayment p ON e.EnrollmentID = p.EnrollmentID
GROUP BY c.CourseName, c.Category
ORDER BY Total_Revenue DESC;

-- Monthly Revenue Trend (Reconciling with Power BI Line Chart)
SELECT 
    DATE_FORMAT(p.PaymentDate, '%Y-%m') AS Payment_Month,
    COUNT(p.PaymentID) AS Total_Transactions,
    SUM(p.AmountPaid) AS Monthly_Revenue
FROM factpayment p
GROUP BY DATE_FORMAT(p.PaymentDate, '%Y-%m')
ORDER BY Payment_Month ASC;

-- Revenue by Payment Method
SELECT 
    PaymentMethod,
    COUNT(PaymentID) AS Transaction_Count,
    SUM(AmountPaid) AS Revenue
FROM factpayment
GROUP BY PaymentMethod
ORDER BY Revenue DESC;