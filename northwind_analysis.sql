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
