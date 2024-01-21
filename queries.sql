-- Retrieve all customers
SELECT * FROM Customer;

-- Retrieve all orders with customer information
SELECT 
    o.OrderID,
    o.OrderDateTime,
    c.FirstName,
    c.Surname,
    p.Name AS ProductName,
    e.Name AS EmployeeName,
    o.PaymentType,
    o.ShippingOption
FROM 
    Orders o
JOIN 
    Customer c ON o.CustomerID = c.CustomerID
JOIN 
    Product p ON o.ProductID = p.ProductID
JOIN 
    Employee e ON o.EmployeeID = e.EmployeeID;


-- Retrieve Employee Information/employees currently working
SELECT *
FROM EMPLOYEE_VIEW;


-- Retrieve Stock Information
SELECT *
FROM STOCK_VIEW;


-- Retrieve Product Sales Information
SELECT *
FROM PRODUCT_SALES_VIEW;

-- Retrieve Mailshot Campaign Details
SELECT *
FROM MAILSHOT_VIEW;


-- Design a query to extract demographic 
-- information and preferences of customers who bought the iPhone 12 series during the specified period.
SELECT 
    C_FIRSTNAME,
    C_SURNAME,
    BIRTHDATE,
    GENDER,
    CONTACTNUMBER,
    MAILSHOT_NAME,
    OUTCOME
FROM 
    MAILSHOT_VIEW
WHERE 
    PROD_NAME = 'iPhone 12'
    AND ORDER_TIMESTAMPTIME BETWEEN TO_DATE('2022-01-01', 'YYYY-MM-DD') AND TO_DATE('2022-12-31', 'YYYY-MM-DD');


-- Design a query to identify customers eligible for returns based on the purchase date.
SELECT 
    C_FIRSTNAME,
    C_SURNAME,
    ORDER_TIMESTAMPTIME,
    PROD_NAME
FROM 
    PRODUCT_SALES_VIEW
WHERE 
    ORDER_TIMESTAMPTIME BETWEEN TO_DATE('2022-01-01', 'YYYY-MM-DD') AND TO_DATE('2022-12-31', 'YYYY-MM-DD');


-- Retrieve employees hired in the last 3 months
SELECT * 
FROM "EMPLOYEE_VIEW"
WHERE DATE_HIRED >= CURRENT_DATE - INTERVAL '3 months';

-- customers who made orders in the last month
SELECT DISTINCT c.FirstName, c.Surname
FROM Customer c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDateTime >= CURRENT_DATE - INTERVAL '1 month';

-- Retrieve product categories and the average price per category
SELECT 
    p.Category,
    AVG(p.PricePerUnit) AS AveragePrice
FROM Product p
GROUP BY p.Category;

-- Retrieve total sales and average discount per mailshot campaign
SELECT 
    mc.MailshotName,
    COUNT(DISTINCT msc.AppleID) AS TotalSales,
    AVG(msc.Discount) AS AverageDiscount
FROM 
    MailshotCampaign mc
JOIN 
    MailshotCustomer msc ON mc.MailshotID = msc.MailshotID
GROUP BY 
    mc.MailshotName;


-- Total Revenue for a Specific Time Period
SELECT 
    SUM(od.Quantity * p.PricePerUnit * (1 - od.Discount)) AS TotalRevenue
FROM 
    Orders o
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
JOIN 
    Product p ON od.ProductID = p.ProductID
WHERE 
    o.OrderDateTime BETWEEN 'start_date' AND 'end_date';


-- Top 5 Products by Sales Quantity
SELECT 
    p.Name AS ProductName,
    SUM(od.Quantity) AS TotalSalesQuantity
FROM 
    Product p
JOIN 
    OrderDetails od ON p.ProductID = od.ProductID
GROUP BY 
    p.Name
ORDER BY 
    TotalSalesQuantity DESC
LIMIT 5;


-- Monthly Revenue Trend
SELECT 
    DATE_TRUNC('month', o.OrderDateTime) AS Month,
    SUM(od.Quantity * p.PricePerUnit * (1 - od.Discount)) AS MonthlyRevenue
FROM 
    Orders o
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
JOIN 
    Product p ON od.ProductID = p.ProductID
GROUP BY 
    Month
ORDER BY 
    Month;

-- Employee Performance Metrics
SELECT 
    e.Name AS EmployeeName,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(od.Quantity * p.PricePerUnit * (1 - od.Discount)) AS TotalSales,
    AVG(od.Discount) AS AverageDiscount
FROM 
    Employee e
JOIN 
    Orders o ON e.EmployeeID = o.EmployeeID
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
JOIN 
    Product p ON od.ProductID = p.ProductID
GROUP BY 
    EmployeeName
ORDER BY 
    TotalSales DESC;


-- Profitability Analysis by Product Category
SELECT 
    p.Category,
    SUM(od.Quantity * p.PricePerUnit * (1 - od.Discount)) AS TotalSales,
    SUM(p.PricePerUnit * od.Quantity - p.CostPerUnit * od.Quantity) AS TotalProfit
FROM 
    Product p
JOIN 
    OrderDetails od ON p.ProductID = od.ProductID
GROUP BY 
    p.Category
ORDER BY 
    TotalProfit DESC;


-- Customer Lifetime Value (CLV)
SELECT 
    c.FirstName || ' ' || c.Surname AS CustomerName,
    SUM(od.Quantity * p.PricePerUnit * (1 - od.Discount)) AS TotalCustomerSpending,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    AVG(p.PricePerUnit * (1 - od.Discount)) AS AverageOrderValue,
    AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.BirthDate))) AS CustomerAge
FROM 
    Customer c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
JOIN 
    Product p ON od.ProductID = p.ProductID
GROUP BY 
    CustomerName
ORDER BY 
    TotalCustomerSpending DESC;
