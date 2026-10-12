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
