# Database Design and Optimization Project: Apple Inc.

## Table of Contents

1. [Company’s Description](#1-companys-description)
2. [Problem Statement](#2-problem-statement)
3. [Business Requirements](#3-business-requirements)
   1. [Core Objectives](#31-core-objectives)
   2. [Key Tables](#32-key-tables)
   3. [Additional Considerations](#33-additional-considerations)
4. [Business Rules](#4-business-rules)
5. [Constraints](#5-constraints)
6. [Relationships](#6-relationships)
7. [Completed Database Design Process](#completed-database-design-process)

## 1. Company’s Description

Apple Inc. is an American multinational technology company founded in the 1970s by Steven Jobs. It specializes in designing, developing, and selling consumer electronics, software, personal computers, smartphones, tablets, and online services. Apple's mission is to provide the best personal computing products and support globally.

## 2. Problem Statement

Increased demand for Apple products during the COVID-19 pandemic has led to performance issues in the company's database. This includes real-time update delays, data redundancies, anomalies, and inconsistencies. To address this, a database redesign is necessary for improved operational performance.

## 3. Business Requirements

### 3.1 Core Objectives

- Track customers (in-store & online)
- Monitor inventory levels
- Manage orders
- Handle premises
- Track mailshot campaigns
- Maintain employee information

### 3.2 Key Tables

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

### 3.3 Additional Considerations

- Handle in-store and online purchases
- Record various payment methods and shipping details for orders
- Track employee details, including reporting relationships and positions
- Manage product stock in different premises
- Track mailshot campaigns

## 4. Business Rules

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

## 5. Constraints

1. Customer gender type can be either ‘F’ or ‘M’ only.
2. Premise type must be either office, state, or warehouse.
3. Employee gender type can be either F or M only.
4. Payment type is either cash, check, credit card, debit card, or online banking.
5. Shipping options are in-store purchase, delivery service, or in-store pickup.
6. Product ID must be between 100 and 200.

## 6. Relationships

- Customers to Apple accounts (one to many)
- Apple accounts to orders (one to many)
- Orders to product (Many to many)
- Employee to orders (one to many)
- Employee to premises (Many to one)
- Products to premises (many to many)
- Orders to shipping details (one to one)
- Apple account to mailshot campaign (many to many)
- Product stock to premises (many to one)

## 7. Completed Database Design Process

Throughout the database design process, I systematically progressed through phases, from understanding requirements to the physical implementation. The flowchart illustrates the steps undertaken to design the Apple Inc. database, ensuring it meets business needs and maintains data integrity and consistency.

### Phase I: Requirements Collection and Analysis

**Database Name:** AppleIncDB

**Data Requirements**

1. **Customers**
   - Attributes: First Name, Surname, Gender, Contact Number
   - Primary Key: Customer ID

2. **Apple Account**
   - Attributes: Apple ID (Primary Key), Email Address (Unique), Customer ID (Foreign Key), Password

3. **Product**
   - Attributes: Product ID (Primary Key), Name, Price, Category

4. **Order**
   - Attributes: Order ID (Primary Key), Order Date and Time, Customer ID (Foreign Key), Product ID (Foreign Key), Employee ID (Foreign Key), Payment Type, Shipping Option, Ship ID (Optional, Foreign Key)

5. **Employee**
   - Attributes: Employee ID (Primary Key), Name, Gender, Date of Birth, Contact, Premise ID (Foreign Key), Date Hired, Date Resigned, Position, Person to Report To (Foreign Key - Recursive), Monthly Salary

6. **Premise**
   - Attributes: Premise ID (Primary Key), Type (Office, Warehouse, Store), Address

7. **Shipping Details**
   - Attributes: Ship ID (Primary Key), Shipping Address, City, State, Postcode, Country

8. **Mailshot Campaign**
   - Attributes: Mailshot ID (Primary Key), Mailshot Name, Start Date, End Date, Outcome (No Response, Order Obtained)

9. **Product Stock**
   - Attributes: Stock ID (Primary Key), Product ID (Foreign Key), Premise ID (Foreign Key), Quantity

**Check Constraints**

1. Customer gender type can be either 'F' or 'M' only.
2. Premise type must be either office, state, or warehouse.
3. Employee gender type can be either F or M only.
4. Payment type is either cash, check, credit card, debit card, or online banking.
5. Shipping options are in-store purchase, delivery service, or in-store pickup.
6. Product ID must be between 100 and 200.

### Phase II

: Conceptual Design

**Entity-Relationship Diagram**

![ER Diagram](AppleDB.png)

### Phase III: Logical Design (Data Model Mapping)

**Logical Schema**

1. **Customers Table**
   - PK: Customer ID
   - Attributes: First Name, Surname, Birthdate, Gender, Contact Number

2. **Apple Account Table**
   - PK: Apple ID
   - FK: Customer ID (references Customers(Customer ID))
   - Attributes: Email Address (Unique), Password

3. **Product Table**
   - PK: Product ID
   - Attributes: Name, Price, Category

4. **Order Table**
   - PK: Order ID
   - FKs: Customer ID (references Customers(Customer ID)), Product ID (references Products(Product ID)), Employee ID (references Employees(Employee ID)), Ship ID (references Ship_Details(Order ID), Optional)
   - Attributes: Order Date and Time, Payment Type, Shipping Option

5. **Employee Table**
   - PK: Employee ID
   - FKs: Premise ID (references Premises(Premise ID)), Person to Report To (references Employees(Employee ID), Recursive)
   - Attributes: Name, Gender, Birthdate, Contact, Date Hired, Date Resigned, Position, Monthly Salary

6. **Premise Table**
   - PK: Premise ID
   - Attributes: Type, Address

7. **Shipping Details Table**
   - PK: Ship ID
   - FK: Order ID (references Orders(Order ID))
   - Attributes: Shipping Address, City, State, Postcode, Country

8. **Mailshot Campaign Table**
   - PK: Mailshot ID
   - Attributes: Mailshot Name, Start Date, End Date, Outcome

9. **Product Stock Table**
   - PKs: Product ID, Premise ID
   - FKs: Product ID (references Products(Product ID)), Premise ID (references Premises(Premise ID))
   - Attributes: Quantity

### Phase IV: Physical Design

**Internal Schema**

Converted the logical database schema into a physical database, created tables, specified columns, column data types, column constraints, and keys.

**Visual Documentation**

- **ER Diagram Image:** [View ER Diagram](path/to/ER_diagram_image.png)
- **Database Schema:** [Online Schema Documentation](https://dbdocs.io/akweiwonder3/AppleDatabase)

The completed database design ensures the Apple Inc. database is structured to meet business requirements, minimize redundancies, and maintain data consistency.

## Prerequisites

Ensure Docker is installed and running on your machine.

## Installation

1. Clone the project repository to your local machine.
2. Create a .env file:
   - Include details:
     - POSTGRES_DB=
     - POSTGRES_USER=
     - POSTGRES_PASSWORD=
     - PGADMIN_DEFAULT_EMAIL=
     - PGADMIN_DEFAULT_PASSWORD=

## Usage

### Docker Images and Docker Compose

Familiarize yourself with Docker images and Docker Compose concepts, essential for configuring and running services.

### Creating Docker Compose File

Orchestrate the PostgreSQL and PGAdmin setup by creating a docker-compose.yml file. Use the provided configuration as a reference.

### Key Explanations

Understand the critical configurations in the Docker Compose file, encompassing services, container settings, environment variables, ports, and volumes.

### Running Docker-Compose

After cloning the project, navigate to its directory in the terminal and execute:

```bash
docker-compose up
```

This command will download the required images and start the services.

### Accessing PGAdmin

Open pgAdmin by accessing http://localhost:8080 in your web browser.

Log in with the default email and password you specified in your docker-compose.yml.

In the pgAdmin dashboard, navigate to the "Servers" section on the left.

Right-click on "Servers" and choose "Create" and then "Server...".

In the "General" tab, provide a name for your server in the "Name" field.

Switch to the "Connection" tab:
- Host name/address: Use the IP address or hostname of your PostgreSQL container. In this case, it's the IP address of your host machine (you might need to replace it with the actual IP).
- Port: Set it to 5432, which is the default port for PostgreSQL.
- Maintenance database: Use the value of ${POSTGRES_DB} from your docker-compose.yml.
- Username: Use the value of ${POSTGRES_USER} from your docker-compose.yml.
- Password: Use the value of ${POSTGRES_PASSWORD} from your docker-compose.yml.

Click "Save" to add the server.

### Data Cleanup

To stop services, use:

```bash
docker-compose down
```
