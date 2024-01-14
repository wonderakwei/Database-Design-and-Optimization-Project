# Database Design 

# Apple-Database-Optimization-Project

## Case Study: Apple Inc.

### 1. Company’s Description

Apple Inc. is a renowned American multinational technology company founded in the 1970s by Steven Jobs. It specializes in designing, developing, and selling a wide range of consumer electronics, computer software, personal computers, smartphones, tablets, and online services. As a pioneer in the personal computer industry, Apple is recognized for popularizing the graphical user interface. The company's mission is to provide the best personal computing products and support to individuals and professionals worldwide, adapting to the dynamic landscape of the consumer electronics market.

### 2. Problem Statement

The demand for Apple products has surged during the global COVID-19 pandemic, leading to increased data stored in the company's database system. This has resulted in a decline in real-time performance for updating records, compounded by data redundancies, anomalies, and inconsistencies. The current database faces challenges during high traffic, particularly during online shopping events and product launches, causing delays, inaccuracies, and potential system shutdowns. To address these issues, a database redesign is imperative to enhance operational performance.

### 3. Business Requirements

#### 3.1 Core Objectives

The database design must facilitate the tracking of customers (in-store & online), monitor inventory levels, manage orders, handle premises, track mailshot campaigns, and maintain employee information.

#### 3.2 Key Tables

1. **Customer Table:**
   - Fields: Customer ID, First Name, Surname, Date of Birth, Gender, Contact Number

2. **Apple Account Table:**
   - Fields: Apple ID (unique), Customer ID, Password

3. **Product Table:**
   - Fields: Product ID, Name, Price per Unit, Product Category

4. **Order Table:**
   - Fields: Order ID, Order Date and Time, Customer ID, Product ID, Employee ID, Payment Type, Shipping Option

5. **Shipping Details Table:**
   - Fields: Ship ID, Shipping Address, City, State, Postcode, Country

6. **Premise Table:**
   - Fields: Premise ID, Premise Type, Premise Address

7. **Employee Table:**
   - Fields: Employee ID, Name, Gender, Date of Birth, Contact, Premise ID, Date Hired, Date Resigned, Position, Person to Report to, Monthly Salary

8. **Product Stock Table:**
   - Fields: Product ID, Premise ID, Quantity

9. **Mailshot Campaign Table:**
   - Fields: Mailshot ID, Mailshot Name, Start Date, End Date

#### 3.3 Additional Considerations

- Handling in-store and online purchases, differentiating between physical store and online store transactions.
- Recording various payment methods and shipping details for orders.
- Tracking employee details, including reporting relationships and positions.
- Managing product stock in different premises and tracking mailshot campaigns.

### 4. Business Rules

1. Each customer may own zero or many Apple accounts.
2. Each Apple account is owned by only one customer.
3. Each Apple account is associated with zero or many mailshot campaigns.
4. Each mailshot campaign is associated with many Apple accounts.
5. Each customer may make zero or many orders.
6. Every order is made by only one customer.
7. Every order must be associated with at least one valid product.
8. Each product may be associated with zero or many orders.
9. Each product may be found in one or many premises.
10. Each premise may have zero or many products.
11. Each premise employs one or many employees.
12. Each employee works at one premise.
13. Each employee reports to zero or one employee.
14. Each employee manages zero or many employees.
15. Each employee processes zero or many orders.
16. Each order is processed by an employee.
17. Each order may have zero or one shipping details.
18. Each shipping detail is associated with one order.

