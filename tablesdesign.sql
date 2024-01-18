CREATE TABLE customer (
    cust_id NUMBER(5) PRIMARY KEY,
    c_firstname VARCHAR2(20),
    c_surname VARCHAR2(20),
    c_birthdate DATE,
    c_gender CHAR(1) CONSTRAINT check_cgender CHECK (c_gender IN ('F','M')),
    c_contact VARCHAR2(15) NOT NULL
);

CREATE INDEX idx_c_name ON customer (c_surname, c_firstname);

-------------------------------
-- apple account table
-------------------------------
CREATE TABLE apple_account (
    apple_id VARCHAR2(30) PRIMARY KEY,
    cust_id NUMBER(5),
    password VARCHAR2(40) NOT NULL,
    FOREIGN KEY (cust_id) references customer(cust_id)
);

-----------------------------------------------
-- mailshot campaign table
-----------------------------------------------
CREATE TABLE mailshot_campaign (
    mailshot_id CHAR(4) PRIMARY KEY,
    mailshot_name VARCHAR2(40) NOT NULL,
    mailshot_start_date DATE NOT NULL,
    mailshot_end_date DATE
);
CREATE INDEX idx_mailshot_name ON mailshot_campaign (mailshot_name);

-------------------------------------------
-- mailshot customer table
-------------------------------------------
CREATE TABLE mailshot_customer (
    mailshot_id CHAR(4),
    apple_id VARCHAR2(30),
    outcome VARCHAR2(30),
    PRIMARY KEY (mailshot_id, apple_id),
    FOREIGN KEY (mailshot_id) references mailshot_campaign (mailshot_id),
    FOREIGN KEY (apple_id) references apple_account (apple_id)
);

-----------------------------------
-- premise table
-----------------------------------
CREATE TABLE premise (
    premise_id VARCHAR2(10) PRIMARY KEY,
    premise_type CHAR(10) NOT NULL CONSTRAINT check_premise CHECK (premise_type IN ('Office','Store','Warehouse')),
    premise_address VARCHAR2(100) NOT NULL,
    premise_city VARCHAR(20) NOT NULL,
    premise_state VARCHAR(20) NOT NULL,
    premise_postcode NUMERIC(5) NOT NULL,
    premise_country VARCHAR2(20) NOT NULL
);

CREATE INDEX idx_premise_type ON premise (premise_type);
CREATE INDEX idx_premise_country ON premise (premise_country);
CREATE INDEX idx_premise_postcode ON premise (premise_postcode);

-----------------------------------
-- employee table
-----------------------------------
CREATE TABLE employee (
    emp_id VARCHAR2(10) PRIMARY KEY,
    emp_firstname VARCHAR2(20) NOT NULL,
    emp_surname VARCHAR2(20) NOT NULL,
    emp_gender CHAR(1) NOT NULL CONSTRAINT check_egender CHECK (emp_gender IN ('F','M')),
    emp_birthdate DATE NOT NULL,
    emp_contact VARCHAR2(15) NOT NULL,
    emp_workplace_id VARCHAR2(10) NOT NULL,
    date_hired DATE NOT NULL,
    date_resigned DATE,
    emp_position VARCHAR2(40) NOT NULL,
    reports_to VARCHAR2(10),
    mth_salary NUMBER(10) NOT NULL,
    FOREIGN KEY (emp_workplace_id) references premise(premise_id)
);

ALTER TABLE employee 
ADD CONSTRAINT reports_to FOREIGN KEY(reports_to) REFERENCES employee (emp_id);
CREATE INDEX idx_emp_surname ON employee (emp_surname, emp_firstname);
CREATE INDEX idx_emp_workplace_id ON employee (emp_workplace_id);
CREATE INDEX idx_emp_position ON employee (emp_position);

--------------------------------------
-- product table
---------------------------------------
CREATE TABLE product (
    prod_id NUMBER(3) PRIMARY KEY
        CONSTRAINT check_prod_id CHECK (prod_id BETWEEN 100 and 200),
    prod_name VARCHAR2(20) NOT NULL,
    prod_unit_price NUMERIC(10, 2) NOT NULL,
    prod_category VARCHAR2(20) NOT NULL
);

-----------------------------------
-- product stock table
-----------------------------------
CREATE TABLE product_stock (
    prod_id NUMBER(3),
    premise_id VARCHAR2(10),
    stock NUMERIC(10) NOT NULL,
    PRIMARY KEY (prod_id, premise_id),
    FOREIGN KEY (prod_id) references product (prod_id),
    FOREIGN KEY (premise_id) references premise (premise_id)
);

CREATE INDEX idx_prod_id ON product_stock (prod_id);
CREATE INDEX idx_premise_id ON product_stock (premise_id);

----------------------------------
-- ship details table
----------------------------------
CREATE TABLE ship_details (
    ship_id VARCHAR2(15) PRIMARY KEY,
    ship_addressline VARCHAR2(100) NOT NULL,
    ship_city VARCHAR2(20) NOT NULL,
    ship_state VARCHAR2(20) NOT NULL,
    ship_postcode NUMBER(5) NOT NULL,
    ship_country VARCHAR2(20) NOT NULL
);

--------------------------------
-- order table
--------------------------------
CREATE TABLE orders (
    order_id CHAR(4) PRIMARY KEY,
    order_datetime DATE NOT NULL,
    cust_id NUMBER(5) NOT NULL,
    emp_id VARCHAR2(10) NOT NULL,
    pay_type VARCHAR2(20) NOT NULL CONSTRAINT check_pay_type CHECK (pay_type IN ('Cash','Check','Credit Card','Debit Card','Online Banking')),
    shipping_option VARCHAR2(40) NOT NULL CONSTRAINT check_shipping_option CHECK (shipping_option IN ('In-store Purchase','Delivery Service','In-store Pickup')),
    ship_id VARCHAR2(15),
    FOREIGN KEY (cust_id) references customer (cust_id),
    FOREIGN KEY (emp_id) references employee (emp_id),
    FOREIGN KEY (ship_id) references ship_details (ship_id)
);

-----------------------------------
-- order details table
-----------------------------------
CREATE TABLE order_details (
    order_id CHAR(4),
    prod_id NUMBER(3),
    quantity NUMBer(1) NOT NULL,
    discount NUMBer(10, 2),
    PRIMARY KEY (order_id, prod_id),
    FOREIGN KEY (order_id) references orders(order_id),
    FOREIGN KEY (prod_id) references product(prod_id)
);

CREATE OR REPLACE VIEW stock_view AS
    SELECT ps.prod_id AS "PRODUCT_ID", p.prod_name AS "PRODUCT NAME", SUM(ps.stock) AS "STOCK"
    FROM product_stock ps, product p
    WHERE ps.prod_id = p.prod_id
    GROUP BY ps.prod_id, p.prod_name
    ORDER BY ps.prod_id;

CREATE OR REPLACE VIEW "EMPLOYEE_VIEW" ("EMP_ID", "EMP_FIRSTNAME", "EMP_SURNAME", "EMP_WORKPLACE_ID", "DATE_HIRED", "EMP_POSITION", "MTH_SALARY") AS 
    SELECT EMPLOYEE.EMP_ID,
            EMPLOYEE.EMP_FIRSTNAME,
            EMPLOYEE.EMP_SURNAME,
            EMPLOYEE.EMP_WORKPLACE_ID,
            EMPLOYEE.DATE_HIRED,
            EMPLOYEE.EMP_POSITION,
            EMPLOYEE.MTH_SALARY 
    FROM EMPLOYEE 
    WHERE EMPLOYEE.DATE_RESIGNED IS NULL;

CREATE OR REPLACE VIEW "PRODUCT_SALES_VIEW" ("C_FIRSTNAME", "C_SURNAME", "ORDER_DATETIME", "PROD_NAME", "PROD_UNIT_PRICE", "QUANTITY", "DISCOUNT", "SUBTOTAL") AS 
  select CUSTOMER.C_FIRSTNAME,
         CUSTOMER.C_SURNAME,
         ORDERS.ORDER_DATETIME,
         PRODUCT.PROD_NAME,
         PRODUCT.PROD_UNIT_PRICE,
         ORDER_DETAILS.QUANTITY,
         ORDER_DETAILS.DISCOUNT,
         PROD_UNIT_PRICE * QUANTITY * (1 - DISCOUNT) as SUBTOTAL
    from PRODUCT,ORDER_DETAILS,ORDERS,CUSTOMER
    where PRODUCT.PROD_ID = ORDER_DETAILS.PROD_ID
    and ORDERS.ORDER_ID = ORDER_DETAILS.ORDER_ID
    and CUSTOMER.CUST_ID = ORDERS.CUST_ID
    order by ORDER_DATETIME desc;

CREATE OR REPLACE VIEW "MAILSHOT_VIEW" ("MAILSHOT_NAME", "MAILSHOT_START_DATE", "MAILSHOT_END_DATE", "C_FIRSTNAME", "C_SURNAME", "OUTCOME") AS 
  select MAILSHOT_CAMPAIGN.MAILSHOT_NAME,
         MAILSHOT_CAMPAIGN.MAILSHOT_START_DATE,
         MAILSHOT_CAMPAIGN.MAILSHOT_END_DATE,
         CUSTOMER.C_FIRSTNAME,
         CUSTOMER.C_SURNAME,
         MAILSHOT_CUSTOMER.OUTCOME 
    from CUSTOMER,APPLE_ACCOUNT,MAILSHOT_CUSTOMER,MAILSHOT_CAMPAIGN
    where MAILSHOT_CAMPAIGN.MAILSHOT_ID = MAILSHOT_CUSTOMER.MAILSHOT_ID
    and MAILSHOT_CUSTOMER.APPLE_ID = APPLE_ACCOUNT.APPLE_ID
    and APPLE_ACCOUNT.CUST_ID = CUSTOMER.CUST_ID
    order by MAILSHOT_END_DATE desc;

