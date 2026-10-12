# Northwind SQL Business Analysis

## Project Overview

This project uses SQL to analyze the Northwind sample database and answer business questions related to order values and employee performance.

## Business Question

Which employees are responsible for the five highest-value orders and should be considered for bonuses?

## Dataset

The project uses the Northwind sample database, which contains the following tables:

- Customers
- Categories
- Employees
- OrderDetails
- Orders
- Products
- Shippers
- Suppliers

## SQL Skills Demonstrated

- Multi-table JOINs
- Aggregate functions (`SUM`)
- Calculated fields
- GROUP BY
- ORDER BY
- LIMIT
- Business-focused data analysis

## SQL Analysis

### Business Question

Which employees are responsible for the five highest-value orders and should be considered for bonuses?

### SQL Query

```sql
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
```

### Approach

The query joins orders with employee records, order details, and product information. It calculates each order's value by multiplying the quantity of each product by its listed price and summing the results for each order. The results are sorted in descending order, and `TOP 5` returns the five highest-value orders.

## Key Findings

The SQL analysis identified the five highest-value orders in the Northwind sample database.

- **Steven Buchanan** was responsible for the highest-value order, Order 10372, with a calculated value of 15,353.60.
- **Robert King** appeared twice among the five highest-value orders.
- **Margaret Peacock** also appeared twice among the five highest-value orders.
- The five orders had a combined calculated value of 66,495.35.

These values were calculated by multiplying each product's quantity by its listed price and summing the results for each order. Discounts, shipping charges, and other adjustments were not included.

## Analysis Approach

The analysis connects orders with employee records, order details, and product prices. It calculates the estimated value of each order by multiplying product quantity by unit price and summing the line values for each order.

The results are sorted from highest to lowest order value to identify the five highest-value orders and their associated employees.

## Business Recommendation

Management can review the employees associated with the highest-value orders as part of its bonus evaluation. Before awarding bonuses, management should also consider additional performance measures, such as total sales across all orders, customer satisfaction, and overall employee contribution.

## Tools

- SQL
- W3Schools SQL Tryit Editor
- GitHub

## Limitations

The estimated order values are based on product prices and quantities. Discounts, taxes, shipping costs, and other adjustments are not included unless explicitly represented in the dataset.

## Conclusion

This project demonstrates how SQL can combine relational data, calculate order values, rank results, and support business decisions.
