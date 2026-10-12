-- Business Question:
-- Which employees are responsible for the five highest-value orders?

SELECT TOP 5
    o.OrderID,
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    SUM(od.Quantity * p.Price) AS OrderAmount
FROM Orders AS o
INNER JOIN Employees AS e
    ON o.EmployeeID = e.EmployeeID
INNER JOIN OrderDetails AS od
    ON o.OrderID = od.OrderID
INNER JOIN Products AS p
    ON od.ProductID = p.ProductID
GROUP BY
    o.OrderID,
    e.EmployeeID,
    e.FirstName,
    e.LastName
ORDER BY
    OrderAmount DESC;

-- ==========================================
-- Analysis 2: Total Sales by Employee
-- Business Question:
-- Which employees generate the highest total sales?
-- ==========================================

SELECT
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(od.Quantity * p.Price) AS TotalSales
FROM Employees AS e
INNER JOIN Orders AS o
    ON e.EmployeeID = o.EmployeeID
INNER JOIN OrderDetails AS od
    ON o.OrderID = od.OrderID
INNER JOIN Products AS p
    ON od.ProductID = p.ProductID
GROUP BY
    e.EmployeeID,
    e.FirstName,
    e.LastName
ORDER BY
    TotalSales DESC;


-- ==========================================
-- Analysis 3: Sales by Product Category
-- Business Question:
-- Which product categories generate the highest sales?
-- ==========================================

SELECT
    c.CategoryID,
    c.CategoryName,
    SUM(od.Quantity * p.Price) AS TotalSales,
    SUM(od.Quantity) AS TotalQuantitySold,
    COUNT(DISTINCT o.OrderID) AS TotalOrders
FROM Categories AS c
INNER JOIN Products AS p
    ON c.CategoryID = p.CategoryID
INNER JOIN OrderDetails AS od
    ON p.ProductID = od.ProductID
INNER JOIN Orders AS o
    ON od.OrderID = o.OrderID
GROUP BY
    c.CategoryID,
    c.CategoryName
ORDER BY
    TotalSales DESC;


-- ==========================================
-- Analysis 4: Customer Purchasing Behavior
-- Business Question:
-- Which customers spend the most and how many
-- orders do they place?
-- ==========================================

SELECT
    c.CustomerID,
    c.CustomerName,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(od.Quantity * p.Price) AS TotalSpent
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails AS od
    ON o.OrderID = od.OrderID
INNER JOIN Products AS p
    ON od.ProductID = p.ProductID
GROUP BY
    c.CustomerID,
    c.CustomerName
ORDER BY
    TotalSpent DESC;


-- ==========================================
-- Analysis 5: Monthly Sales Trends
-- Business Question:
-- Which months generate the highest sales?
-- ==========================================

SELECT
    YEAR(o.OrderDate) AS SalesYear,
    MONTH(o.OrderDate) AS SalesMonth,
    SUM(od.Quantity * p.Price) AS TotalSales,
    COUNT(DISTINCT o.OrderID) AS TotalOrders
FROM Orders AS o
INNER JOIN OrderDetails AS od
    ON o.OrderID = od.OrderID
INNER JOIN Products AS p
    ON od.ProductID = p.ProductID
GROUP BY
    YEAR(o.OrderDate),
    MONTH(o.OrderDate)
ORDER BY
    SalesYear,
    SalesMonth;



