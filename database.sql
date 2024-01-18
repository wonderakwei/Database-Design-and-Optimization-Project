SET datestyle = 'ISO, MDY'

DROP TABLE order_details

DROP TABLE orders

DROP TABLE ship_details

DROP TABLE product_stock

DROP TABLE product

DROP TABLE employee

DROP TABLE premise

DROP TABLE mailshot_customer

DROP TABLE mailshot_campaign

DROP TABLE apple_account

DROP TABLE customer


-----------------------------------
-- customer table
-----------------------------------
CREATE TABLE customer (
    cust_id NUMERIC(5) PRIMARY KEY,
    c_firstname VARCHAR(20),
    c_surname VARCHAR(20),
    c_birthdate TIMESTAMP,
    c_gender CHAR(1) CHECK (c_gender IN ('F','M')),
    c_contact VARCHAR(15) NOT NULL
)

INSERT INTO customer VALUES (50001,'Isabelle','Olson','10-SEP-2001','F','410-562-8643')

INSERT INTO customer VALUES (50002,'Daphne','Morrison','31-JAN-2000','F','223-636-2238')

INSERT INTO customer VALUES (50003,'Ray','Green','05-MAR-1995','M','440-731-6693')

INSERT INTO customer VALUES (50004,'Nicholas','Sparks','21-MAY-1998','M','520-828-3824')

INSERT INTO customer VALUES (50005,'Joshua','McKenzie','04-AUG-1999','M','207-256-2765')

INSERT INTO customer VALUES (50006,'Fiona','Brady','08-JUL-2000','F','6011-290-0414')

INSERT INTO customer VALUES (50007,'Bethany','Manning','02-MAR-1995','F','724-379-7733')

INSERT INTO customer VALUES (50008,'Simon','Hall','07-DEC-1993','M','206-267-6945')

INSERT INTO customer VALUES (50009,'Desmond','Kim','21-OCT-2001','M','304-458-1441')

INSERT INTO customer VALUES (50010,'Taylor','Swift','30-JUN-2000','M','6010-405-3587')

INSERT INTO customer VALUES (50011,'Eve','Janes','05-DEC-1995','F','725-376-5474')

INSERT INTO customer VALUES (50012,'Andrew','Lee','22-AUG-1990','M','424-788-0286')

INSERT INTO customer VALUES (50013,'Brandon','Bennett','11-DEC-1995','M','220-267-2607')

INSERT INTO customer VALUES (50014,'Danny','Parker','06-MAR-1990','M','310-838-6164')

INSERT INTO customer VALUES (50015,'Sara','Flynn','25-MAY-1989','F','304-303-7670')

INSERT INTO customer VALUES (50016,'Kira','Snyder','28-APR-1999','F','412-347-6226')

INSERT INTO customer VALUES (50017,'Edwin','Shaw','17-SEP-2000','M','415-262-2692')

INSERT INTO customer VALUES (50018,'Miles','Ellis','18-NOV-1995','M','303-463-2740')

INSERT INTO customer VALUES (50019,'Matthew','Lee','23-JUN-1998','M','346-283-7600')

INSERT INTO customer VALUES (50020,'Darcie','Mills','04-JUN-1999','F','220-967-6907')

INSERT INTO customer VALUES (50021,'Mark','Lee','12-JUL-2000','M','309-362-5248')

INSERT INTO customer VALUES (50022,'Abby','Sawyer','02-JAN-1995','F','6012-259-6163')

INSERT INTO customer VALUES (50023,'Ellie','Zong','22-JUL-1993','F','262-681-2021')

INSERT INTO customer VALUES (50024,'Jess','Newton','10-SEP-2001','F','214-580-0513')

INSERT INTO customer VALUES (50025,'Joshua','Gardner','12-NOV-2001','M','408-588-1492')

INSERT INTO customer VALUES (50026,'Tia','White','30-JAN-2000','F','617-982-5427')

INSERT INTO customer VALUES (50027,'Bryan','Benson','05-FEB-1995','M','806-406-4504')

INSERT INTO customer VALUES (50028,'Amber','Liu','08-FEB-1990','F','423-754-9978')

INSERT INTO customer VALUES (50029,'Chester','Briggs','12-FEB-1995','M','415-761-0785')

INSERT INTO customer VALUES (50030,'Jeremiah','Lucas','06-MAR-1990','M','530-805-3638')

INSERT INTO customer VALUES (50031,'Anna','Stone','05-MAY-1989','F','206-348-0670')

INSERT INTO customer VALUES (50032,'Lisa','Cooper','18-APR-1999','F','309-569-2251')

INSERT INTO customer VALUES (50033,'Emily','Nguyen','08-JUL-2000','F','319-909-2135')

INSERT INTO customer VALUES (50034,'Johnny','See','02-MAR-1995','M','906-286-2197')

INSERT INTO customer VALUES (50035,'Olivia','Owen','07-DEC-1993','F','707-573-9351')

INSERT INTO customer VALUES (50036,'Justin','Phillips','10-NOV-2001','M','516-778-3401')

INSERT INTO customer VALUES (50037,'Sophie','Young','30-JAN-2000','F','505-354-1635')

INSERT INTO customer VALUES (50038,'Rita','Kim','05-FEB-1995','F','205-623-9811')

INSERT INTO customer VALUES (50039,'Elon','Musk','01-FEB-1990','M','229-955-4352')

INSERT INTO customer VALUES (50040,'Calvin','Hobbs','11-FEB-1995','M','326-677-5321')

INSERT INTO customer VALUES (50041,'Bill','Jenkins','01-MAR-1990','M','214-521-2579')

INSERT INTO customer VALUES (50042,'Jack','Lynch','05-MAY-1989','M','206-258-7245')

INSERT INTO customer VALUES (50043,'Joe','Austin','18-APR-1999','M','304-458-1441')

INSERT INTO customer VALUES (50044,'Serena','Willis','17-AUG-2000','F','610-435-5287')

INSERT INTO customer VALUES (50045,'Yasmin','Charles','28-FEB-1995','F','725-345-6574')

INSERT INTO customer VALUES (50046,'Jasmine','Marquez','01-MAR-1990','F','424-728-1236')

INSERT INTO customer VALUES (50047,'Maya','Quinn','05-MAY-1989','F','220-317-2307')

INSERT INTO customer VALUES (50048,'Gerald','Carter','18-APR-1999','M','310-840-7764')

INSERT INTO customer VALUES (50049,'Melanie','Wong','17-AUG-2000','F','6014-323-8870')

INSERT INTO customer VALUES (50050,'Maddie','Smith','28-FEB-1995','F','312-998-4591')

INSERT INTO customer VALUES (50051,'Abdul','Basit','06-OCT-1996','M','312-678-8643')



CREATE INDEX idx_c_name ON customer (c_surname, c_firstname)


-------------------------------
-- apple account table
-------------------------------
CREATE TABLE apple_account (
    apple_id VARCHAR(30) PRIMARY KEY,
    cust_id NUMERIC(5),
    password VARCHAR(40) NOT NULL,
    FOREIGN KEY (cust_id) references customer(cust_id)
)

INSERT INTO apple_account VALUES ('isabelleolson@gmail.com',50001,'isa23J')

INSERT INTO apple_account VALUES ('daphnemorrison@gmail.com',50002,'d4phn3#')

INSERT INTO apple_account VALUES ('raygreen@outlook.com',50003,'r4ygreEn')

INSERT INTO apple_account VALUES ('nicsparks@gmail.com',50004,'panicspark123')

INSERT INTO apple_account VALUES ('joshmck@outlook.com',50005,'josh277*B')

INSERT INTO apple_account VALUES ('fionabrady@gmail.com',50006,'fionab993q')

INSERT INTO apple_account VALUES ('bethmanning@outlook.com',50007,'breathingH2o')

INSERT INTO apple_account VALUES ('simonhall@gmail.com',50008,'halloffame123')

INSERT INTO apple_account VALUES ('desmondkim@outlook.com',50009,'kpossible99')

INSERT INTO apple_account VALUES ('taylorswift@gmail.com',50010,'fearless13')

INSERT INTO apple_account VALUES ('evejanes@outlook.com',50011,'newyearseve2021')

INSERT INTO apple_account VALUES ('andrewlee@outlook.com',50012,'leeAndrew321')

INSERT INTO apple_account VALUES ('brandonbenn@gmail.com',50013,'ben10ftw')

INSERT INTO apple_account VALUES ('dannparker@outlook.com',50014,'danparkerman55')

INSERT INTO apple_account VALUES ('saraflynn@gmail.com',50015,'$araCanfly')

INSERT INTO apple_account VALUES ('kiras@gmail.com',50016,'kirasatudua3')

INSERT INTO apple_account VALUES ('edwinshaw@outlook.com',50017,'edwin5hAw?')

INSERT INTO apple_account VALUES ('milesellis@gmail.com',50018,'milesaway1211')

INSERT INTO apple_account VALUES ('matthewlee@gmail.com',50019,'mattlee365')

INSERT INTO apple_account VALUES ('darciemills@outlook.com',50020,'darcmillions255')

INSERT INTO apple_account VALUES ('marklee@outlook.com',50021,'ramleeburger1999')

INSERT INTO apple_account VALUES ('absawyer2000@yahoo.com',50022,'absawyou2233')

INSERT INTO apple_account VALUES ('ezong1811@gmail.com',50023,'ezpz947@#')

INSERT INTO apple_account VALUES ('jnewton@yahoo.com',50024,'newton2306%')

INSERT INTO apple_account VALUES ('joshuag0604@gmail.com',50025,'joshgardensB4Y')

INSERT INTO apple_account VALUES ('tiawhite7777@outlook.com',50026,'tia7white#')

INSERT INTO apple_account VALUES ('bbenson1995@gmail.com',50027,'bbbenz10+')

INSERT INTO apple_account VALUES ('amber22@yahoo.com',50028,'amberone223')

INSERT INTO apple_account VALUES ('cbriggs@hotmail.com',50029,'brigneyspears123')

INSERT INTO apple_account VALUES ('jeremiahLuc1112@yahoo.com',50030,'luck112233')

INSERT INTO apple_account VALUES ('annastone30@outlook.com',50031,'emmastonewitha!')

INSERT INTO apple_account VALUES ('liscooper231@gmail.com',50032,'icecreamscoop231')

INSERT INTO apple_account VALUES ('emnguyen8@yahoo.com',50033,'emnyone23')

INSERT INTO apple_account VALUES ('johnsee95@outlook.com',50034,'johncena212')

INSERT INTO apple_account VALUES ('olivia456@gmail.com',50035,'oliviagames4546')

INSERT INTO apple_account VALUES ('justinphillips@yahoo.com',50036,'phillipslight05')

INSERT INTO apple_account VALUES ('sopyoung199@hotmail.com',50037,'sophyoung789#')

INSERT INTO apple_account VALUES ('ritakim2000@hotmail.com',50038,'ritaora&kpossib13')

INSERT INTO apple_account VALUES ('elonmusk@gmail.com',50039,'melonmusk44')

INSERT INTO apple_account VALUES ('calvinhobbs@outlook.com',50040,'kleinhobbs993')

INSERT INTO apple_account VALUES ('billjenkins93@yahoo.com',50041,'bikins1110%')

INSERT INTO apple_account VALUES ('jackly31@gmail.com',50042,'jackjackj532')

INSERT INTO apple_account VALUES ('joeaus995@yahoo.com',50043,'joe@0205')

INSERT INTO apple_account VALUES ('serenawills1@outlook.com',50044,'serenawillwin111')

INSERT INTO apple_account VALUES ('yasminc@hotmail.com',50045,'yasminC95=')

INSERT INTO apple_account VALUES ('jasminem03@gmail.com',50046,'jasminerice90')

INSERT INTO apple_account VALUES ('mayaquinn555@gmail.com',50047,'mayaheemayahaha')

INSERT INTO apple_account VALUES ('gcarter18@outlook.com',50048,'geraldcarvroom15')

INSERT INTO apple_account VALUES ('melaniew@yahoo.com',50049,'nienonieno')

INSERT INTO apple_account VALUES ('maddiesmith2802@gmail.com',50050,'madismiff2899')


-----------------------------------------------
-- mailshot campaign table
-----------------------------------------------
CREATE TABLE mailshot_campaign (
    mailshot_id CHAR(4) PRIMARY KEY,
    mailshot_name VARCHAR(40) NOT NULL,
    mailshot_start_date TIMESTAMP NOT NULL,
    mailshot_end_date TIMESTAMP
)

INSERT INTO mailshot_campaign VALUES ('MS01','Black friday sales','23-NOV-2018','23-NOV-2018')

INSERT INTO mailshot_campaign VALUES ('MS02','Black friday sales','29-NOV-2019','29-NOV-2019')

INSERT INTO mailshot_campaign VALUES ('MS03','Black friday sales','27-NOV-2020','27-NOV-2020')

INSERT INTO mailshot_campaign VALUES ('MS04','11.11 sale','01-NOV-2018','11-NOV-2018')

INSERT INTO mailshot_campaign VALUES ('MS05','11.11 sale','01-NOV-2019','11-NOV-2019')

INSERT INTO mailshot_campaign VALUES ('MS06','11.11 sale','01-NOV-2020','11-NOV-2020')

INSERT INTO mailshot_campaign VALUES ('MS07','Spring Clearance','22-JUN-2018','29-JUN-2018')

INSERT INTO mailshot_campaign VALUES ('MS08','Spring Clearance','22-JUN-2019','29-JUN-2019')

INSERT INTO mailshot_campaign VALUES ('MS09','Spring Clearance','22-JUN-2020','29-JUN-2020')

INSERT INTO mailshot_campaign VALUES ('MS10','Happy education offer','01-JAN-2019','07-JAN-2019')

INSERT INTO mailshot_campaign VALUES ('MS11','Happy education offer','25-DEC-2018','31-DEC-2018')

INSERT INTO mailshot_campaign VALUES ('MS12','Happy education offer','25-DEC-2020','31-DEC-2020')

INSERT INTO mailshot_campaign VALUES ('MS13','Happy education offer','10-JAN-2021','17-JAN-2021')

INSERT INTO mailshot_campaign VALUES ('MS14','Mothers Day Promo','06-MAY-2018','13-MAY-2018')

INSERT INTO mailshot_campaign VALUES ('MS15','Mothers Day Promo','05-MAY-2019','12-MAY-2019')

INSERT INTO mailshot_campaign VALUES ('MS16','Mothers Day Promo','03-MAY-2020','10-MAY-2020')

INSERT INTO mailshot_campaign VALUES ('MS17','Mothers Day Promo','02-MAY-2021','09-MAY-2021')

INSERT INTO mailshot_campaign VALUES ('MS18','Fathers Day Promo','10-JUN-2018','17-JUN-2018')

INSERT INTO mailshot_campaign VALUES ('MS19','Fathers Day Promo','11-JUN-2019','16-JUN-2019')

INSERT INTO mailshot_campaign VALUES ('MS20','Fathers Day Promo','16-JUN-2020','21-JUN-2020')

INSERT INTO mailshot_campaign VALUES ('MS21','Fathers Day Promo','15-JUN-2021','20-JUN-2021')


CREATE INDEX idx_mailshot_name ON mailshot_campaign (mailshot_name)


-------------------------------------------
-- mailshot customer table
-------------------------------------------
CREATE TABLE mailshot_customer (
    mailshot_id CHAR(4),
    apple_id VARCHAR(30),
    outcome VARCHAR(30),
    PRIMARY KEY (mailshot_id, apple_id),
    FOREIGN KEY (mailshot_id) references mailshot_campaign (mailshot_id),
    FOREIGN KEY (apple_id) references apple_account (apple_id)
)

INSERT INTO mailshot_customer VALUES ('MS01','isabelleolson@gmail.com','No Response')

INSERT INTO mailshot_customer VALUES ('MS01','daphnemorrison@gmail.com','No Response')

INSERT INTO mailshot_customer VALUES ('MS01','raygreen@outlook.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS01','nicsparks@gmail.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS01','joshmck@outlook.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS01','fionabrady@gmail.com','No Response')

INSERT INTO mailshot_customer VALUES ('MS02','bethmanning@outlook.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS02','simonhall@gmail.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS02','desmondkim@outlook.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS02','taylorswift@gmail.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS02','evejanes@outlook.com','No Response')

INSERT INTO mailshot_customer VALUES ('MS03','andrewlee@outlook.com','No Response')

INSERT INTO mailshot_customer VALUES ('MS03','brandonbenn@gmail.com','No Response')

INSERT INTO mailshot_customer VALUES ('MS03','dannparker@outlook.com','No Response')

INSERT INTO mailshot_customer VALUES ('MS03','saraflynn@gmail.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS04','kiras@gmail.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS04','edwinshaw@outlook.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS05','milesellis@gmail.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS05','matthewlee@gmail.com','No Response')

INSERT INTO mailshot_customer VALUES ('MS06','darciemills@outlook.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS06','marklee@outlook.com','No Response')

INSERT INTO mailshot_customer VALUES ('MS07','absawyer2000@yahoo.com','No Response')

INSERT INTO mailshot_customer VALUES ('MS07','ezong1811@gmail.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS08','jnewton@yahoo.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS09','joshuag0604@gmail.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS10','tiawhite7777@outlook.com','No Response')

INSERT INTO mailshot_customer VALUES ('MS10','bbenson1995@gmail.com','No Response')

INSERT INTO mailshot_customer VALUES ('MS10','amber22@yahoo.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS11','cbriggs@hotmail.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS11','jeremiahLuc1112@yahoo.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS11','annastone30@outlook.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS11','liscooper231@gmail.com','No Response')

INSERT INTO mailshot_customer VALUES ('MS11','emnguyen8@yahoo.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS12','johnsee95@outlook.com','No Response')

INSERT INTO mailshot_customer VALUES ('MS12','olivia456@gmail.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS12','justinphillips@yahoo.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS13','sopyoung199@hotmail.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS13','ritakim2000@hotmail.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS14','elonmusk@gmail.com','No Response')

INSERT INTO mailshot_customer VALUES ('MS14','calvinhobbs@outlook.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS15','billjenkins93@yahoo.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS15','jackly31@gmail.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS16','joeaus995@yahoo.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS16','serenawills1@outlook.com','No Response')

INSERT INTO mailshot_customer VALUES ('MS17','yasminc@hotmail.com','No Response')

INSERT INTO mailshot_customer VALUES ('MS18','jasminem03@gmail.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS18','mayaquinn555@gmail.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS19','gcarter18@outlook.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS20','melaniew@yahoo.com','Order Obtained')

INSERT INTO mailshot_customer VALUES ('MS21','maddiesmith2802@gmail.com','No Response')


-----------------------------------
-- premise table
-----------------------------------
CREATE TABLE premise (
    premise_id VARCHAR(10) PRIMARY KEY,
    premise_type CHAR(10) NOT NULL CHECK (premise_type IN ('Office','Store','Warehouse')),
    premise_address VARCHAR(100) NOT NULL,
    premise_city VARCHAR(20) NOT NULL,
    premise_state VARCHAR(20) NOT NULL,
    premise_postcode NUMERIC(5) NOT NULL,
    premise_country VARCHAR(20) NOT NULL
)

INSERT INTO premise VALUES ('WH001CA','Warehouse','654 S Myers St','Los Angeles','California',94027,'USA')

INSERT INTO premise VALUES ('WH002CA','Warehouse','655 S Myers St','Los Angeles','California',94027,'USA')

INSERT INTO premise VALUES ('OF001LA','Office','W Jefferson Dr','Los Angeles','California',94027,'USA')

INSERT INTO premise VALUES ('OF002LA','Office','10000 Washington Blvd','Los Angeles','California',94027,'USA')

INSERT INTO premise VALUES ('ST001LA','Store','189 The Grove Dr','Los Angeles','California',94027,'USA')

INSERT INTO premise VALUES ('ST002SD','Store','4305 La Jolla Village Dr','San Diego','California',94027,'USA')

INSERT INTO premise VALUES ('WH001TX','Warehouse','15505 Long Vista Dr # 210','Austin','Texas',20001,'USA')

INSERT INTO premise VALUES ('WH002TX','Warehouse','8002 Burleson Rd','Austin','Texas',20001,'USA')

INSERT INTO premise VALUES ('ST001AT','Store','3121 Palm Way','Austin','Texas',20001,'USA')

INSERT INTO premise VALUES ('OF001HT','Office','5085 Westheimer Rd','Houston','Texas',20001,'USA')

INSERT INTO premise VALUES ('WH001NY','Warehouse','6 W 35th St','New York','New York',10001,'USA')

INSERT INTO premise VALUES ('WH002NY','Warehouse','14 Hall St, Brooklyn','New York','New York',10001,'USA')

INSERT INTO premise VALUES ('OF001NY','Office','767 5th Ave','New York','New York',10001,'USA')

INSERT INTO premise VALUES ('ST001NY','Store','Terminal, 45 Grand Central','New York','New York',10001,'USA')

INSERT INTO premise VALUES ('ST002NY','Store','940 Madison Ave','New York','New York',10001,'USA')

INSERT INTO premise VALUES ('WH001KL','Warehouse','9, Jalan Tandang 204a','Kuala Lumpur','Selangor',40150,'Malaysia')

INSERT INTO premise VALUES ('ST001KL','Store','3RD FLOOR, Petronas Twin Tower','Kuala Lumpur','Selangor',40150,'Malaysia')

INSERT INTO premise VALUES ('ST002KL','Store','G-063, Mid Valley Megamall','Kuala Lumpur','Selangor',40150,'Malaysia')

INSERT INTO premise VALUES ('OF001KL','Office','Level 11 Menara CIMB, Jalan Stesen Sentral 2','Kuala Lumpur','Selangor',40150,'Malaysia')

INSERT INTO premise VALUES ('OF002CHR','Office','First Floor, AEON Mall','Cheras','Selangor',40150,'Malaysia')

INSERT INTO premise VALUES ('WH001TYO','Warehouse','2 Chome-33-8 Kitazawa','Shibuya','Tokyo',99687,'Japan')

INSERT INTO premise VALUES ('ST001SHI','Store','1 Chome-20-9 Jinnan','Shibuya','Tokyo',99687,'Japan')

INSERT INTO premise VALUES ('OF001SHI','Office','4 Chome-2-13 Jingumae','Shibuya','Tokyo',99687,'Japan')

INSERT INTO premise VALUES ('ST001AKH','Store','〒101-0021 Tokyo','Akihabara','Tokyo',99687,'Japan')

INSERT INTO premise VALUES ('ST001HRJ','Store','3 Chome-5-12 Ginza','Harajuku','Tokyo',99687,'Japan')

INSERT INTO premise VALUES ('WH001WL','Warehouse','Ty-Glas Ave, Llanishen','Cardiff','Wales',48643,'England')

INSERT INTO premise VALUES ('WH002WL','Warehouse','10 Duke St','Cardiff','Wales',48643,'England')

INSERT INTO premise VALUES ('ST001CAR','Store','63-66 Grand Arcade, St Davids Centre','Cardiff','Wales',48643,'England')

INSERT INTO premise VALUES ('OF001ED','Office','133 Fountainbridge','Edinburgh','Scotland',48643,'England')

INSERT INTO premise VALUES ('OF002ED','Office','10 Princes St','Edinburgh','Scotland',48643,'England')

INSERT INTO premise VALUES ('WH001ST','Warehouse','Shan Mei St','Tai Long Wan','Sha Tin',90033,'Hong Kong')

INSERT INTO premise VALUES ('WH002ST','Warehouse','8-10 Siu Lek Yuen Road','Tai Long Wan','Sha Tin',90033,'Hong Kong')

INSERT INTO premise VALUES ('ST001TLW','Store','沙田正街18號 新城市廣場1期L4/426-428','Tai Long Wan','Sha Tin',90033,'Hong Kong')

INSERT INTO premise VALUES ('OF001TLW','Office','銅鑼灣勿地臣街1號時代廣場第1座24字樓2401室','Tai Long Wan','Sha Tin',90033,'Hong Kong')

INSERT INTO premise VALUES ('OF002TLW','Office','25號 Canton Rd','Tai Long Wan','Sha Tin',90033,'Hong Kong')

INSERT INTO premise VALUES ('WH001QL','Warehouse','3/175 Jackson Rd, Sunnybank Hills','Brisbane','Queensland',23901,'Australia')

INSERT INTO premise VALUES ('WH002QL','Warehouse','8 McLachlan St, Fortitude Valley','Brisbane','Queensland',23901,'Australia')

INSERT INTO premise VALUES ('OF001BB','Office','1151 Creek Road','Brisbane','Queensland',23901,'Australia')

INSERT INTO premise VALUES ('ST001BB','Store','MacArthur Chambers, 233 Queen Street','Brisbane','Queensland',23901,'Australia')

INSERT INTO premise VALUES ('ST002GC','Store','Australia Fair Shopping Centre, 42 Marine Parade','Gold Coast','Queensland',23901,'Australia')

INSERT INTO premise VALUES ('OF001KB','Office','968 U Chu Liang Bldg.','Krabi','Krabi',11111,'Thailand')

INSERT INTO premise VALUES ('ST001KB','Store','254/5, Krabi Noi, Mueang Krabi District','Krabi','Krabi',11111,'Thailand')

INSERT INTO premise VALUES ('WH001BJ','Warehouse','Haidian District','Beijing','Beijing',79218,'China')

INSERT INTO premise VALUES ('WH002SH','Warehouse','Minhang District','Shanghai','Shanghai',79218,'China')

INSERT INTO premise VALUES ('OF001BJ','Office','71 Di anmen W St, Shi Cha Hai, Xicheng District','Beijing','Beijing',79218,'China')

INSERT INTO premise VALUES ('ST001BJ','Store','131 Xidan N St, Xi Dan, Xicheng District','Beijing','Beijing',79218,'China')

INSERT INTO premise VALUES ('ST002BJ','Store','101 Chaoyang N Rd','Beijing','Beijing',79218,'China')

INSERT INTO premise VALUES ('ST003SH','Store','Dongcheng, Wangfujing','Shanghai','Shanghai',79218,'China')

INSERT INTO premise VALUES ('WH001VAN','Warehouse','22753 Dewdney Trunk Rd','Maple Ridge','Vancouver',99431,'Canada')

INSERT INTO premise VALUES ('OF001COQ','Office','3030 Lincoln Ave #211','Coquitlam','Vancouver',99431,'Canada')

INSERT INTO premise VALUES ('ST001COQ','Store','2929 Barnet Hwy','Coquitlam','Vancouver',99431,'Canada')


CREATE INDEX idx_premise_type ON premise (premise_type)

CREATE INDEX idx_premise_country ON premise (premise_country)

CREATE INDEX idx_premise_postcode ON premise (premise_postcode)


-----------------------------------
-- employee table
-----------------------------------
CREATE TABLE employee (
    emp_id VARCHAR(10) PRIMARY KEY,
    emp_firstname VARCHAR(20) NOT NULL,
    emp_surname VARCHAR(20) NOT NULL,
    emp_gender CHAR(1) NOT NULL CHECK (emp_gender IN ('F','M')),
    emp_birthdate TIMESTAMP NOT NULL,
    emp_contact VARCHAR(15) NOT NULL,
    emp_workplace_id VARCHAR(10) NOT NULL,
    date_hired TIMESTAMP NOT NULL,
    date_resigned TIMESTAMP,
    emp_position VARCHAR(40) NOT NULL,
    reports_to VARCHAR(10),
    mth_salary NUMERIC(10) NOT NULL,
    FOREIGN KEY (emp_workplace_id) references premise(premise_id)
)


INSERT INTO employee VALUES ('RE100','Joe','Jonas','M','06-MAY-2000','215-443-8345','ST001LA','08-AUG-2012','06-DEC-2015','Retail','COO100',2500)

INSERT INTO employee VALUES ('SE100','Benny','Sim','M','27-SEP-1985','725-389-2138','OF001LA','13-OCT-2012',NULL,'Software Engineer','SSM100',8000)

INSERT INTO employee VALUES ('COO100','Takashi','Marumoto','M','16-JAN-1992','223-532-6793','OF001LA','06-NOV-2013',NULL,'Chief Operating Officer','SCOO100',9100)

INSERT INTO employee VALUES ('MAN100','Selena','Gomez','F','11-APR-1987','520-327-3424','ST002SD','26-JUL-2016',NULL,'Manager','SM200',5500)

INSERT INTO employee VALUES ('MAN200','Tamia','Nguyen','F','28-FEB-1991','207-316-7256','WH001TX','04-JUL-2015','17-JUL-2016','Manager','SNM100',5500)

INSERT INTO employee VALUES ('RE200','Chris','Perry','M','30-MAR-1991','318-930-6494','ST001LA','25-SEP-2019',NULL,'Retail','COO100',2500)

INSERT INTO employee VALUES ('MAR100','Lilian','Carroll','F','30-OCT-1994','725-609-7733','ST001AT','24-SEP-2016',NULL,'Marketing','AD100',6000)

INSERT INTO employee VALUES ('HE100','Joel','Tan','M','08-JUL-1980','215-638-7345','WH001NY','16-NOV-2009',NULL,'Hardware Engineer','SSM100',7500)

INSERT INTO employee VALUES ('MAN300','Suzuki','Ayato','M','20-APR-1976','304-473-1421','WH002TX','22-SEP-2010',NULL,'Manager','SNM100',5500)

INSERT INTO employee VALUES ('RE300','Nellie','Palmer','F','19-NOV-1995','610-957-3247','ST002SD','17-MAY-2016','01-JUN-2020','Retail','COO100',2500)

INSERT INTO employee VALUES ('HR100','Dexter','Chan','M','07-NOV-1987','725-987-5452','OF001HT','18-JAN-2017',NULL,'Human Resources','SCOO100',3300)

INSERT INTO employee VALUES ('COO200','Chantelle','Lee','F','01-OCT-1988','424-768-7386','OF001LA','03-JAN-2011',NULL,'Chief Operating Officer','SCOO100',9100)

INSERT INTO employee VALUES ('RE400','Christine','Ford','F','15-FEB-1995','215-497-2607','ST001NY','22-MAY-2019',NULL,'Retail','COO100',2500)

INSERT INTO employee VALUES ('HR200','Tom','Miller','M','12-DEC-1986','310-844-6937','OF001HT','20-APR-2017','08-AUG-2019','Human Resources','SCOO100',3300)

INSERT INTO employee VALUES ('UID100','Louis','Russell','M','04-MAY-1994','310-863-7570','OF001TLW','06-MAY-2015',NULL,'User Interface Designer','CDO100',4500)

INSERT INTO employee VALUES ('CO100','Hayley','Myers','F','09-AUG-1992','412-647-6273','OF001NY','31-AUG-2019',NULL,'Communication','SNM100',3000)

INSERT INTO employee VALUES ('UID200','Jacob','Singh','M','12-FEB-1990','415-594-4863','OF001NY','11-APR-2014','10-DEC-2020','User Interface Designer','CDO200',4500)

INSERT INTO employee VALUES ('SE200','Robin','Coleman','M','20-MAY-1982','303-859-6040','OF001KL','13-AUG-2010',NULL,'Software Engineer','SM100',8000)

INSERT INTO employee VALUES ('SM100','Lewis','Kim','M','08-SEP-1989','415-594-4754','OF001LA','05-NOV-2013',NULL,'Software Manager','AD100',8800)

INSERT INTO employee VALUES ('SE300','Monica','Clarke','F','13-MAR-1987','220-447-9007','OF001HT','18-OCT-2012',NULL,'Software Engineer','SM100',8000)

INSERT INTO employee VALUES ('SNM100','Charlie','Howell','M','07-NOV-1980','309-528-3253','WH001CA','05-OCT-2011',NULL,'Senior Manager',NULL,8500)

INSERT INTO employee VALUES ('SCOO100','Louisa','Allison','F','07-JAN-1980','410-472-0047','OF001LA','07-APR-2008',NULL,'Senior Chief Operating Officer',NULL,9300)

INSERT INTO employee VALUES ('RE500','Nial','Russel','M','19-MAY-1994','262-681-2009','ST001TLW','22-JUL-2018',NULL,'Retail','COO200',2500)

INSERT INTO employee VALUES ('RE600','Troy','Smith','M','20-JUN-1996','214-638-1995','ST001CAR','05-APR-2017','15-FEB-2019','Retail','COO200',2500)

INSERT INTO employee VALUES ('HR300','Fred','Pan','M','31-JAN-1991','408-619-3893','OF002CHR','10-NOV-2012',NULL,'Human Resources','SCOO100',3300)

INSERT INTO employee VALUES ('CDO100','Wayne','Fernandez','M','04-MAY-1987','617-386-5729','OF002LA','11-APR-2013',NULL,'Chief Design Officer','SCDO100',9050)

INSERT INTO employee VALUES ('MAN400','Patricia','Jennings','F','11-FEB-1988','806-405-8829','ST001KB','02-DEC-2011',NULL,'Manager','SNM100',5500)

INSERT INTO employee VALUES ('SCDO100','Mason','Holland','M','06-JUL-1987','215-100-0513','OF001KL','30-MAY-2012',NULL,'Senior Chief Design Officer',NULL,9000)

INSERT INTO employee VALUES ('HR400','Allen','Granger','M','02-AUG-1987','408-560-1532','OF002LA','30-DEC-2017',NULL,'Human Resources','SNM100',3300)

INSERT INTO employee VALUES ('SSM100','Abby','Evans','F','18-JUN-1980','617-722-1237','OF001HT','08-JUL-2009',NULL,'Senior Software Manager',NULL,9500)

INSERT INTO employee VALUES ('UID300','Adam','Phillips','M','31-JUL-1989','806-427-4639','OF002LA','23-APR-2011',NULL,'User Interface Designer','CDO100',4500)

INSERT INTO employee VALUES ('ID200','Amanda','Brooke','F','21-MAR-1985','423-846-9004','OF002LA','19-SEP-2009',NULL,'Industrial Designer','CDO200',6000)

INSERT INTO employee VALUES ('AD100','David','Lee','M','08-APR-1977','415-100-3331','OF001LA','09-NOV-2004',NULL,'Admin',NULL,10000)

INSERT INTO employee VALUES ('IN100','Isaiah','Ray','M','06-AUG-2001','530-805-2253','WH001BJ','01-OCT-2020',NULL,'Intern','SSM100',1500)

INSERT INTO employee VALUES ('HR500','Isac','Sim','M','05-MAY-1989','206-442-0320','OF001KB','02-NOV-2013','16-MAR-2019','Human Resources','SNM100',3300)

INSERT INTO employee VALUES ('IN200','Daniella','Harper','F','18-APR-1999','309-569-7421','OF002ED','23-DEC-2020',NULL,'Intern','SM200',1500)

INSERT INTO employee VALUES ('CDO200','Theo','Miles','M','27-APR-1998','319-909-7318','OF002TLW','09-MAY-2018',NULL,'Chief Design Officer','SCDO100',9050)

INSERT INTO employee VALUES ('RE700','Scott','Patterson','M','02-MAR-1995','906-286-0021','ST002BJ','10-MAY-2016','08-OCT-2019','Retail','COO200',2500)

INSERT INTO employee VALUES ('IN300','Josh','Walker','M','07-DEC-1993','707-009-9311','OF002TLW','12-FEB-2020',NULL,'Intern','COO200',1500)

INSERT INTO employee VALUES ('RE900','Paula','Sander','F','10-NOV-1999','516-778-3253','ST003SH','23-MAY-2019',NULL,'Retail','COO100',2500)

INSERT INTO employee VALUES ('RE1000','Eden','Carson','M','25-JUN-1998','505-553-1635','ST001COQ','22-JUL-2018',NULL,'Retail','COO200',2500)

INSERT INTO employee VALUES ('SM200','Zoe','Lamer','F','05-FEB-1985','205-643-7733','OF001ED','16-JUN-2006','09-NOV-2018','Software Manager','AD100',8300)

INSERT INTO employee VALUES ('IN400','Bella','Hadid','F','01-FEB-1999','229-915-6432','ST001BJ','25-DEC-2020',NULL,'Intern','SCDO100',1500)

INSERT INTO employee VALUES ('MAR200','Harry','Potter','M','23-DEC-1995','326-877-5321','OF001COQ','22-OCT-2015',NULL,'Marketing','AD100',6000)

INSERT INTO employee VALUES ('IN500','Connor','Gray','M','10-MAR-1997','214-826-6202','OF001BJ','28-JAN-2020',NULL,'Intern','COO100',1500)

INSERT INTO employee VALUES ('IN600','Jodie','Blair','F','16-SEP-1998','206-743-5194','OF001BB','29-JAN-2021',NULL,'Intern','SCDO100',1500)

INSERT INTO employee VALUES ('UID400','Henry','Lau','M','22-MAR-1980','304-458-2005','OF001COQ','02-JUL-2007','30-JAN-2019','User Interface Designer','CDO200',4500)

INSERT INTO employee VALUES ('UID500','Emma','Roberts','F','17-AUG-1984','610-665-5287','OF001BJ','01-NOV-2004','05-APR-2018','User Interface Designer','CDO100',4500)

INSERT INTO employee VALUES ('IN700','Jasper','Briggs','M','28-FEB-1995','725-341-6932','WH001VAN','25-JAN-2021',NULL,'Intern','SM200',1500)

INSERT INTO employee VALUES ('SE400','Jemima','Nguyen','F','13-NOV-1989','424-328-0004','OF001COQ','30-JAN-2011',NULL,'Software Engineer','SM100',8000)


ALTER TABLE employee 
ADD CONSTRAINT reports_to FOREIGN KEY(reports_to) REFERENCES employee (emp_id)

CREATE INDEX idx_emp_surname ON employee (emp_surname, emp_firstname)

CREATE INDEX idx_emp_workplace_id ON employee (emp_workplace_id)

CREATE INDEX idx_emp_position ON employee (emp_position)


--------------------------------------
-- product table
---------------------------------------
CREATE TABLE product (
    prod_id NUMERIC(3) PRIMARY KEY
        CHECK (prod_id BETWEEN 100 and 200),
    prod_name VARCHAR(20) NOT NULL,
    prod_unit_price NUMERIC(10, 2) NOT NULL,
    prod_category VARCHAR(20) NOT NULL
)

INSERT INTO product VALUES (100,'27-inch iMac',359.99,'PC')

INSERT INTO product VALUES (101,'Mac mini',319.99,'PC')

INSERT INTO product VALUES (102,'M1 MacBook Pro',299.99,'MacBook')

INSERT INTO product VALUES (103,'M1 MacBook Air',249.99,'MacBook')

INSERT INTO product VALUES (104,'13-inch MacBook Pro',239.99,'MacBook')

INSERT INTO product VALUES (105,'MacBook Air',229.99,'MacBook')

INSERT INTO product VALUES (106,'iPhone SE',179.99,'iPhone')

INSERT INTO product VALUES (107,'iPhone 11',189.99,'iPhone')

INSERT INTO product VALUES (108,'iPhone 11 Pro',200.99,'iPhone')

INSERT INTO product VALUES (109,'iPhone 11 Pro Max',219.99,'iPhone')

INSERT INTO product VALUES (110,'iPhone 12 ',259.99,'iPhone')

INSERT INTO product VALUES (111,'iPhone 12 Pro',279.99,'iPhone')

INSERT INTO product VALUES (112,'iPhone 12 Pro Max',300.99,'iPhone')

INSERT INTO product VALUES (113,'iPad Pro',199.99,'iPad')

INSERT INTO product VALUES (114,'iPad Air',159.99,'iPad')

INSERT INTO product VALUES (115,'Apple Watch Series 6',89.99,'Watches')

INSERT INTO product VALUES (116,'Apple Watch SE',79.99,'Watches')

INSERT INTO product VALUES (117,'Airpods Pro',69.99,'Music Accesories')

INSERT INTO product VALUES (118,'AirPods Max',59.99,'Music Accesories')

INSERT INTO product VALUES (119,'Apple Pencil',49.99,'Writing Tool')

INSERT INTO product VALUES (120,'Air Tag',39.99,'Locating Device')


-----------------------------------
-- product stock table
-----------------------------------
CREATE TABLE product_stock (
    prod_id NUMERIC(3),
    premise_id VARCHAR(10),
    stock NUMERIC(10) NOT NULL,
    PRIMARY KEY (prod_id, premise_id),
    FOREIGN KEY (prod_id) references product (prod_id),
    FOREIGN KEY (premise_id) references premise (premise_id)
)

INSERT INTO product_stock VALUES (100,'ST001LA',47)

INSERT INTO product_stock VALUES (100,'WH001TX',11684)

INSERT INTO product_stock VALUES (100,'ST001AT',59)

INSERT INTO product_stock VALUES (100,'WH001NY',12032)

INSERT INTO product_stock VALUES (100,'ST001NY',99)

INSERT INTO product_stock VALUES (100,'WH001KL',1469)

INSERT INTO product_stock VALUES (100,'ST002KL',88)

INSERT INTO product_stock VALUES (100,'WH001TYO',1745)

INSERT INTO product_stock VALUES (100,'ST001AKH',102)

INSERT INTO product_stock VALUES (100,'WH002WL',1600)

INSERT INTO product_stock VALUES (100,'WH002ST',1405)

INSERT INTO product_stock VALUES (100,'ST002GC',64)

INSERT INTO product_stock VALUES (100,'ST001KB',58)

INSERT INTO product_stock VALUES (100,'ST001BJ',39)

INSERT INTO product_stock VALUES (100,'ST002BJ',74)

INSERT INTO product_stock VALUES (100,'ST003SH',58)

INSERT INTO product_stock VALUES (100,'WH001VAN',1945)

INSERT INTO product_stock VALUES (101,'WH001CA',12001)

INSERT INTO product_stock VALUES (101,'ST001LA',63)

INSERT INTO product_stock VALUES (101,'WH002NY',1761)

INSERT INTO product_stock VALUES (101,'ST001KL',55)

INSERT INTO product_stock VALUES (101,'ST001SHI',62)

INSERT INTO product_stock VALUES (101,'ST001AKH',41)

INSERT INTO product_stock VALUES (101,'WH001WL',1002)

INSERT INTO product_stock VALUES (101,'ST001CAR',55)

INSERT INTO product_stock VALUES (101,'WH002ST',1036)

INSERT INTO product_stock VALUES (101,'ST001TLW',41)

INSERT INTO product_stock VALUES (101,'WH001QL',1234)

INSERT INTO product_stock VALUES (101,'ST001BB',51)

INSERT INTO product_stock VALUES (101,'ST001KB',32)

INSERT INTO product_stock VALUES (101,'WH002SH',998)

INSERT INTO product_stock VALUES (101,'ST002BJ',45)

INSERT INTO product_stock VALUES (101,'WH001VAN',1758)

INSERT INTO product_stock VALUES (102,'WH001CA',12210)

INSERT INTO product_stock VALUES (102,'WH002CA',10045)

INSERT INTO product_stock VALUES (102,'ST001LA',89)

INSERT INTO product_stock VALUES (102,'WH001TX',3006)

INSERT INTO product_stock VALUES (102,'WH002TX',1001)

INSERT INTO product_stock VALUES (102,'WH001NY',11450)

INSERT INTO product_stock VALUES (102,'ST002NY',99)

INSERT INTO product_stock VALUES (102,'WH001KL',1256)

INSERT INTO product_stock VALUES (102,'ST002KL',63)

INSERT INTO product_stock VALUES (102,'ST001SHI',45)

INSERT INTO product_stock VALUES (102,'WH002WL',1289)

INSERT INTO product_stock VALUES (102,'WH001ST',2003)

INSERT INTO product_stock VALUES (102,'ST001TLW',101)

INSERT INTO product_stock VALUES (102,'WH002QL',1789)

INSERT INTO product_stock VALUES (102,'ST001BB',23)

INSERT INTO product_stock VALUES (102,'ST001KB',47)

INSERT INTO product_stock VALUES (102,'ST001BJ',55)

INSERT INTO product_stock VALUES (102,'ST003SH',32)

INSERT INTO product_stock VALUES (102,'WH001VAN',6425)

INSERT INTO product_stock VALUES (102,'ST001COQ',77)

INSERT INTO product_stock VALUES (103,'ST002SD',54)

INSERT INTO product_stock VALUES (103,'WH001TX',12004)

INSERT INTO product_stock VALUES (103,'WH002TX',9842)

INSERT INTO product_stock VALUES (103,'WH001NY',15000)

INSERT INTO product_stock VALUES (103,'WH002NY',14350)

INSERT INTO product_stock VALUES (103,'ST001KL',87)

INSERT INTO product_stock VALUES (103,'ST001SHI',65)

INSERT INTO product_stock VALUES (103,'ST001AKH',42)

INSERT INTO product_stock VALUES (103,'WH001WL',1443)

INSERT INTO product_stock VALUES (103,'ST001CAR',121)

INSERT INTO product_stock VALUES (103,'WH001ST',4063)

INSERT INTO product_stock VALUES (103,'WH002QL',1220)

INSERT INTO product_stock VALUES (103,'ST002GC',54)

INSERT INTO product_stock VALUES (103,'ST001KB',24)

INSERT INTO product_stock VALUES (103,'ST002BJ',78)

INSERT INTO product_stock VALUES (103,'ST003SH',26)

INSERT INTO product_stock VALUES (104,'WH001CA',16547)

INSERT INTO product_stock VALUES (104,'WH002CA',12654)

INSERT INTO product_stock VALUES (104,'ST001LA',67)

INSERT INTO product_stock VALUES (104,'WH002TX',1542)

INSERT INTO product_stock VALUES (104,'WH002NY',14267)

INSERT INTO product_stock VALUES (104,'ST001NY',75)

INSERT INTO product_stock VALUES (104,'ST002KL',90)

INSERT INTO product_stock VALUES (104,'ST001AKH',72)

INSERT INTO product_stock VALUES (104,'ST001HRJ',15)

INSERT INTO product_stock VALUES (104,'WH001WL',1470)

INSERT INTO product_stock VALUES (104,'ST001CAR',84)

INSERT INTO product_stock VALUES (104,'ST001TLW',34)

INSERT INTO product_stock VALUES (104,'WH001QL',4681)

INSERT INTO product_stock VALUES (104,'ST002GC',67)

INSERT INTO product_stock VALUES (104,'ST001BJ',45)

INSERT INTO product_stock VALUES (104,'ST002BJ',24)

INSERT INTO product_stock VALUES (104,'WH001VAN',9994)

INSERT INTO product_stock VALUES (105,'WH001CA',17462)

INSERT INTO product_stock VALUES (105,'ST001LA',45)

INSERT INTO product_stock VALUES (105,'ST002SD',68)

INSERT INTO product_stock VALUES (105,'WH001NY',18756)

INSERT INTO product_stock VALUES (105,'ST001NY',75)

INSERT INTO product_stock VALUES (105,'ST002NY',99)

INSERT INTO product_stock VALUES (105,'WH001TYO',1756)

INSERT INTO product_stock VALUES (105,'ST001AKH',45)

INSERT INTO product_stock VALUES (105,'ST001HRJ',78)

INSERT INTO product_stock VALUES (105,'WH001WL',598)

INSERT INTO product_stock VALUES (105,'WH001ST',1674)

INSERT INTO product_stock VALUES (105,'ST001TLW',187)

INSERT INTO product_stock VALUES (105,'WH001QL',1775)

INSERT INTO product_stock VALUES (105,'WH001BJ',1745)

INSERT INTO product_stock VALUES (105,'ST002BJ',47)

INSERT INTO product_stock VALUES (105,'ST001COQ',52)

INSERT INTO product_stock VALUES (106,'ST001LA',78)

INSERT INTO product_stock VALUES (106,'ST002SD',45)

INSERT INTO product_stock VALUES (106,'ST001AT',24)

INSERT INTO product_stock VALUES (106,'WH001NY',17466)

INSERT INTO product_stock VALUES (106,'ST001NY',74)

INSERT INTO product_stock VALUES (106,'WH001KL',1467)

INSERT INTO product_stock VALUES (106,'WH001TYO',1687)

INSERT INTO product_stock VALUES (106,'ST001HRJ',45)

INSERT INTO product_stock VALUES (106,'WH002WL',786)

INSERT INTO product_stock VALUES (106,'ST001CAR',46)

INSERT INTO product_stock VALUES (106,'WH001QL',1450)

INSERT INTO product_stock VALUES (106,'WH002QL',441)

INSERT INTO product_stock VALUES (106,'ST002GC',45)

INSERT INTO product_stock VALUES (106,'ST001KB',68)

INSERT INTO product_stock VALUES (106,'WH001BJ',1746)

INSERT INTO product_stock VALUES (106,'ST001BJ',54)

INSERT INTO product_stock VALUES (107,'WH001CA',17856)

INSERT INTO product_stock VALUES (107,'WH002CA',14653)

INSERT INTO product_stock VALUES (107,'WH002TX',1006)

INSERT INTO product_stock VALUES (107,'WH002NY',17564)

INSERT INTO product_stock VALUES (107,'WH001KL',1745)

INSERT INTO product_stock VALUES (107,'ST001KL',475)

INSERT INTO product_stock VALUES (107,'ST001SHI',276)

INSERT INTO product_stock VALUES (107,'WH001WL',5773)

INSERT INTO product_stock VALUES (107,'ST001CAR',333)

INSERT INTO product_stock VALUES (107,'WH001ST',6346)

INSERT INTO product_stock VALUES (107,'WH002ST',5673)

INSERT INTO product_stock VALUES (107,'WH002QL',6345)

INSERT INTO product_stock VALUES (107,'ST001BB',3452)

INSERT INTO product_stock VALUES (107,'WH002SH',5757)

INSERT INTO product_stock VALUES (107,'ST003SH',365)

INSERT INTO product_stock VALUES (107,'ST001COQ',345)

INSERT INTO product_stock VALUES (108,'WH002CA',7573)

INSERT INTO product_stock VALUES (108,'WH001TX',6456)

INSERT INTO product_stock VALUES (108,'ST001NY',562)

INSERT INTO product_stock VALUES (108,'ST002NY',642)

INSERT INTO product_stock VALUES (108,'WH001KL',5673)

INSERT INTO product_stock VALUES (108,'ST002KL',573)

INSERT INTO product_stock VALUES (108,'ST001HRJ',275)

INSERT INTO product_stock VALUES (108,'WH002WL',6432)

INSERT INTO product_stock VALUES (108,'WH001ST',4523)

INSERT INTO product_stock VALUES (108,'ST001TLW',253)

INSERT INTO product_stock VALUES (108,'WH001QL',3515)

INSERT INTO product_stock VALUES (108,'ST001KB',253)

INSERT INTO product_stock VALUES (108,'WH001VAN',6431)

INSERT INTO product_stock VALUES (109,'WH002CA',5325)

INSERT INTO product_stock VALUES (109,'ST001LA',562)

INSERT INTO product_stock VALUES (109,'ST002SD',645)

INSERT INTO product_stock VALUES (109,'ST001AT',385)

INSERT INTO product_stock VALUES (109,'WH002NY',5657)

INSERT INTO product_stock VALUES (109,'WH001KL',5621)

INSERT INTO product_stock VALUES (109,'ST002KL',573)

INSERT INTO product_stock VALUES (109,'WH001TYO',4621)

INSERT INTO product_stock VALUES (109,'ST001HRJ',254)

INSERT INTO product_stock VALUES (109,'ST001CAR',452)

INSERT INTO product_stock VALUES (109,'WH001ST',5673)

INSERT INTO product_stock VALUES (109,'ST001TLW',351)

INSERT INTO product_stock VALUES (109,'WH001QL',4546)

INSERT INTO product_stock VALUES (109,'ST001BB',321)

INSERT INTO product_stock VALUES (109,'ST001BJ',235)

INSERT INTO product_stock VALUES (109,'ST003SH',264)

INSERT INTO product_stock VALUES (110,'WH002CA',5467)

INSERT INTO product_stock VALUES (110,'WH001TX',3421)

INSERT INTO product_stock VALUES (110,'WH001NY',4646)

INSERT INTO product_stock VALUES (110,'ST002NY',321)

INSERT INTO product_stock VALUES (110,'ST001KL',345)

INSERT INTO product_stock VALUES (110,'ST001SHI',226)

INSERT INTO product_stock VALUES (110,'WH001WL',5472)

INSERT INTO product_stock VALUES (110,'WH002WL',4562)

INSERT INTO product_stock VALUES (110,'ST001CAR',273)

INSERT INTO product_stock VALUES (110,'WH002ST',5262)

INSERT INTO product_stock VALUES (110,'ST001TLW',258)

INSERT INTO product_stock VALUES (110,'WH002QL',5354)

INSERT INTO product_stock VALUES (110,'ST002GC',279)

INSERT INTO product_stock VALUES (110,'WH001BJ',4341)

INSERT INTO product_stock VALUES (110,'ST001BJ',219)

INSERT INTO product_stock VALUES (110,'ST003SH',321)

INSERT INTO product_stock VALUES (111,'WH001CA',3411)

INSERT INTO product_stock VALUES (111,'WH002TX',4351)

INSERT INTO product_stock VALUES (111,'ST001AT',215)

INSERT INTO product_stock VALUES (111,'WH002NY',4341)

INSERT INTO product_stock VALUES (111,'WH001KL',4512)

INSERT INTO product_stock VALUES (111,'ST002KL',321)

INSERT INTO product_stock VALUES (111,'WH001WL',3414)

INSERT INTO product_stock VALUES (111,'WH002WL',4321)

INSERT INTO product_stock VALUES (111,'WH002ST',4526)

INSERT INTO product_stock VALUES (111,'ST001TLW',218)

INSERT INTO product_stock VALUES (111,'ST002GC',134)

INSERT INTO product_stock VALUES (111,'ST001KB',341)

INSERT INTO product_stock VALUES (111,'ST002BJ',231)

INSERT INTO product_stock VALUES (111,'WH001VAN',3454)

INSERT INTO product_stock VALUES (112,'WH002CA',4451)

INSERT INTO product_stock VALUES (112,'WH001TX',4231)

INSERT INTO product_stock VALUES (112,'WH002TX',4134)

INSERT INTO product_stock VALUES (112,'ST001AT',225)

INSERT INTO product_stock VALUES (112,'WH001NY',4343)

INSERT INTO product_stock VALUES (112,'ST002NY',111)

INSERT INTO product_stock VALUES (112,'ST001SHI',222)

INSERT INTO product_stock VALUES (112,'WH001WL',3123)

INSERT INTO product_stock VALUES (112,'WH002WL',5132)

INSERT INTO product_stock VALUES (112,'WH002ST',5343)

INSERT INTO product_stock VALUES (112,'ST001TLW',414)

INSERT INTO product_stock VALUES (112,'ST001KB',435)

INSERT INTO product_stock VALUES (112,'WH002SH',3425)

INSERT INTO product_stock VALUES (112,'ST001COQ',123)

INSERT INTO product_stock VALUES (113,'WH001CA',4513)

INSERT INTO product_stock VALUES (113,'ST002SD',214)

INSERT INTO product_stock VALUES (113,'WH002TX',4123)

INSERT INTO product_stock VALUES (113,'WH002NY',3311)

INSERT INTO product_stock VALUES (113,'WH001KL',3443)

INSERT INTO product_stock VALUES (113,'ST001SHI',231)

INSERT INTO product_stock VALUES (113,'ST001AKH',215)

INSERT INTO product_stock VALUES (113,'WH001ST',4123)

INSERT INTO product_stock VALUES (113,'WH002ST',3414)

INSERT INTO product_stock VALUES (113,'WH001QL',4431)

INSERT INTO product_stock VALUES (113,'ST001BB',213)

INSERT INTO product_stock VALUES (113,'WH001BJ',3111)

INSERT INTO product_stock VALUES (114,'WH002CA',5241)

INSERT INTO product_stock VALUES (114,'ST001LA',216)

INSERT INTO product_stock VALUES (114,'ST002SD',214)

INSERT INTO product_stock VALUES (114,'WH002NY',4341)

INSERT INTO product_stock VALUES (114,'ST001NY',241)

INSERT INTO product_stock VALUES (114,'WH001KL',3423)

INSERT INTO product_stock VALUES (114,'ST001SHI',168)

INSERT INTO product_stock VALUES (114,'WH001WL',3511)

INSERT INTO product_stock VALUES (114,'WH002ST',5131)

INSERT INTO product_stock VALUES (114,'ST001TLW',167)

INSERT INTO product_stock VALUES (114,'ST001BB',164)

INSERT INTO product_stock VALUES (114,'ST002GC',143)

INSERT INTO product_stock VALUES (114,'ST001KB',155)

INSERT INTO product_stock VALUES (114,'ST001BJ',156)

INSERT INTO product_stock VALUES (115,'WH001CA',3145)

INSERT INTO product_stock VALUES (115,'ST001LA',154)

INSERT INTO product_stock VALUES (115,'ST001AT',179)

INSERT INTO product_stock VALUES (115,'WH001NY',3435)

INSERT INTO product_stock VALUES (115,'WH002NY',4231)

INSERT INTO product_stock VALUES (115,'WH001KL',3424)

INSERT INTO product_stock VALUES (115,'ST002KL',221)

INSERT INTO product_stock VALUES (115,'WH001TYO',4311)

INSERT INTO product_stock VALUES (115,'WH002WL',4132)

INSERT INTO product_stock VALUES (115,'WH001ST',3431)

INSERT INTO product_stock VALUES (115,'ST001TLW',212)

INSERT INTO product_stock VALUES (115,'WH001QL',5231)

INSERT INTO product_stock VALUES (115,'ST002GC',132)

INSERT INTO product_stock VALUES (115,'WH001BJ',4521)

INSERT INTO product_stock VALUES (115,'ST001BJ',129)

INSERT INTO product_stock VALUES (115,'ST003SH',114)

INSERT INTO product_stock VALUES (116,'WH002TX',4521)

INSERT INTO product_stock VALUES (116,'WH001NY',4521)

INSERT INTO product_stock VALUES (116,'ST001NY',163)

INSERT INTO product_stock VALUES (116,'ST002NY',154)

INSERT INTO product_stock VALUES (116,'ST001AKH',133)

INSERT INTO product_stock VALUES (116,'ST001CAR',146)

INSERT INTO product_stock VALUES (116,'WH001ST',4521)

INSERT INTO product_stock VALUES (116,'ST001TLW',213)

INSERT INTO product_stock VALUES (116,'WH002QL',5421)

INSERT INTO product_stock VALUES (116,'ST002GC',144)

INSERT INTO product_stock VALUES (116,'WH002SH',6421)

INSERT INTO product_stock VALUES (116,'ST001BJ',223)

INSERT INTO product_stock VALUES (116,'ST003SH',210)

INSERT INTO product_stock VALUES (117,'WH002CA',4142)

INSERT INTO product_stock VALUES (117,'ST002SD',132)

INSERT INTO product_stock VALUES (117,'WH002TX',6864)

INSERT INTO product_stock VALUES (117,'WH001NY',6636)

INSERT INTO product_stock VALUES (117,'ST001KL',113)

INSERT INTO product_stock VALUES (117,'ST001AKH',156)

INSERT INTO product_stock VALUES (117,'ST001HRJ',134)

INSERT INTO product_stock VALUES (117,'WH001WL',1312)

INSERT INTO product_stock VALUES (117,'WH002WL',5462)

INSERT INTO product_stock VALUES (117,'WH002ST',4624)

INSERT INTO product_stock VALUES (117,'WH001QL',4135)

INSERT INTO product_stock VALUES (117,'ST002GC',173)

INSERT INTO product_stock VALUES (117,'WH001BJ',3124)

INSERT INTO product_stock VALUES (117,'WH001VAN',5236)

INSERT INTO product_stock VALUES (117,'ST001COQ',110)

INSERT INTO product_stock VALUES (118,'WH001CA',6235)

INSERT INTO product_stock VALUES (118,'ST002SD',242)

INSERT INTO product_stock VALUES (118,'WH002TX',5235)

INSERT INTO product_stock VALUES (118,'ST002NY',215)

INSERT INTO product_stock VALUES (118,'ST001KL',105)

INSERT INTO product_stock VALUES (118,'ST002KL',109)

INSERT INTO product_stock VALUES (118,'ST001HRJ',111)

INSERT INTO product_stock VALUES (118,'WH001WL',3415)

INSERT INTO product_stock VALUES (118,'ST001CAR',167)

INSERT INTO product_stock VALUES (118,'ST001TLW',118)

INSERT INTO product_stock VALUES (118,'ST001KB',112)

INSERT INTO product_stock VALUES (118,'ST001BJ',231)

INSERT INTO product_stock VALUES (118,'ST003SH',123)

INSERT INTO product_stock VALUES (119,'WH002CA',4214)

INSERT INTO product_stock VALUES (119,'ST001AT',234)

INSERT INTO product_stock VALUES (119,'WH001NY',2245)

INSERT INTO product_stock VALUES (119,'ST002NY',125)

INSERT INTO product_stock VALUES (119,'ST002KL',150)

INSERT INTO product_stock VALUES (119,'ST001SHI',175)

INSERT INTO product_stock VALUES (119,'WH002WL',8864)

INSERT INTO product_stock VALUES (119,'ST001CAR',175)

INSERT INTO product_stock VALUES (119,'ST001BB',146)

INSERT INTO product_stock VALUES (119,'ST001KB',123)

INSERT INTO product_stock VALUES (119,'WH002SH',245)

INSERT INTO product_stock VALUES (119,'ST001COQ',179)

INSERT INTO product_stock VALUES (120,'WH001CA',2215)

INSERT INTO product_stock VALUES (120,'WH001TX',6643)

INSERT INTO product_stock VALUES (120,'WH002TX',4214)

INSERT INTO product_stock VALUES (120,'WH001NY',33567)

INSERT INTO product_stock VALUES (120,'ST001NY',208)

INSERT INTO product_stock VALUES (120,'WH001TYO',2345)

INSERT INTO product_stock VALUES (120,'ST001SHI',210)

INSERT INTO product_stock VALUES (120,'ST001CAR',196)

INSERT INTO product_stock VALUES (120,'WH001QL',2096)

INSERT INTO product_stock VALUES (120,'ST001BB',78)

INSERT INTO product_stock VALUES (120,'ST003SH',90)

INSERT INTO product_stock VALUES (120,'ST001COQ',100)


CREATE INDEX idx_prod_id ON product_stock (prod_id)

CREATE INDEX idx_premise_id ON product_stock (premise_id)


----------------------------------
-- ship details table
----------------------------------
CREATE TABLE ship_details (
    ship_id VARCHAR(15) PRIMARY KEY,
    ship_addressline VARCHAR(100) NOT NULL,
    ship_city VARCHAR(20) NOT NULL,
    ship_state VARCHAR(20) NOT NULL,
    ship_postcode NUMERIC(5) NOT NULL,
    ship_country VARCHAR(20) NOT NULL
)

INSERT INTO ship_details VALUES ('AP856665017','11807 Westheimer Rd #550','Houston','Texas',20001,'USA')

INSERT INTO ship_details VALUES ('AP554618648','3801 N Capital of Texas Hwy Ste E240','Austin','Texas',20001,'USA')

INSERT INTO ship_details VALUES ('AP452979650','1234 Wilshire Blvd #104','Los Angeles','California',94027,'USA')

INSERT INTO ship_details VALUES ('AP922731465','1235 Wilshire Blvd #104','Los Angeles','California',94027,'USA')

INSERT INTO ship_details VALUES ('AP351526482','1236 Wilshire Blvd #104','Los Angeles','California',94027,'USA')

INSERT INTO ship_details VALUES ('AP157898844','1237 Wilshire Blvd #104','Los Angeles','California',94027,'USA')

INSERT INTO ship_details VALUES ('AP887761129','8601 NW 72nd St','Miami','Florida',10007,'USA')

INSERT INTO ship_details VALUES ('AP908848415','8602 NW 72nd St','Miami','Florida',10007,'USA')

INSERT INTO ship_details VALUES ('AP100686842','Fortune City One, 1 Ngan Shing St','Tai Long Wan','Sha Tin',90033,'Hong Kong')

INSERT INTO ship_details VALUES ('AP223246166','Near West Police Station, Choumuhani','Agartala','Tripura',55327,'India')

INSERT INTO ship_details VALUES ('AP023351107','47 Taman Sejahtera','Cheras','Selangor',40150,'Malaysia')

INSERT INTO ship_details VALUES ('AP968860617','62, 64 Chesterton Rd','Cambridge','Massachusetts',63101,'USA')

INSERT INTO ship_details VALUES ('AP539307419','62, 64 Chesterton Rd','Cambridge','Massachusetts',63101,'USA')

INSERT INTO ship_details VALUES ('AP931833406','62, 64 Chesterton Rd','Cambridge','Massachusetts',63101,'USA')

INSERT INTO ship_details VALUES ('AP162281564','151 Tremont St','Boston','Massachusetts',63101,'USA')

INSERT INTO ship_details VALUES ('AP580985985','152 Tremont St','Boston','Massachusetts',63101,'USA')

INSERT INTO ship_details VALUES ('AP969641900','32 Downing Street','Cardiff','Wales',48643,'England')

INSERT INTO ship_details VALUES ('AP480735517','58 Downing Street','Cardiff','Wales',48643,'England')

INSERT INTO ship_details VALUES ('AP736814805','3450 Sacramento St','San Francisco','California',94027,'USA')

INSERT INTO ship_details VALUES ('AP783023244','4231 Balboa Ave','San Diego','California',94027,'USA')

INSERT INTO ship_details VALUES ('AP593723926','4232 Balboa Ave','San Diego','California',94027,'USA')

INSERT INTO ship_details VALUES ('AP103785623','12 Taman Damai','Cheras','Selangor',40150,'Malaysia')

INSERT INTO ship_details VALUES ('AP835971688','11807 Westheimer Rd #550','Houston','Texas',20001,'USA')

INSERT INTO ship_details VALUES ('AP942192500',' 30 Loyang Way','Loyang West','Pasir Ris',59204,'Singapore')

INSERT INTO ship_details VALUES ('AP834721318','3450 Sacramento St','San Francisco','California',94027,'USA')

INSERT INTO ship_details VALUES ('AP616413099','3451 Sacramento St','San Francisco','California',94027,'USA')

INSERT INTO ship_details VALUES ('AP940600285','3452 Sacramento St','San Francisco','California',94027,'USA')

INSERT INTO ship_details VALUES ('AP364445990','3453 Sacramento St','San Francisco','California',94027,'USA')

INSERT INTO ship_details VALUES ('AP229137487','Morrisons Nottingham Eastwood','Eastwood ','Adelaide',50090,'Australia')

INSERT INTO ship_details VALUES ('AP613845339','11807 Westheimer Rd #550','Houston','Texas',20001,'USA')

INSERT INTO ship_details VALUES ('AP211542277','3 Chome-13-11 Shibuya','Shibuya','Tokyo',99687,'Japan')

INSERT INTO ship_details VALUES ('AP782077731','Japan, 〒060-0063 Hokkaido','Sapporo','Hokkaido',69007,'Japan')

INSERT INTO ship_details VALUES ('AP093781307','3801 N Capital of Texas Hwy Ste E240','Austin','Texas',20001,'USA')

INSERT INTO ship_details VALUES ('AP415051659','261 Queen St, Brisbane City QLD 4000','Brisbane','Queensland',23901,'Australia')

INSERT INTO ship_details VALUES ('AP750527933','2532 Gold Coast Hwy, Mermaid Beach QLD 4220','Gold Coast','Queensland',23901,'Australia')

INSERT INTO ship_details VALUES ('AP614902125','8602 NW 72nd St','Miami','Florida',10007,'USA')

INSERT INTO ship_details VALUES ('AP805994265','8602 NW 72nd St','Miami','Florida',10007,'USA')

INSERT INTO ship_details VALUES ('AP109615137','114 Kuhl Avenue','Atlanta','Georgia',20674,'USA')

INSERT INTO ship_details VALUES ('AP179698076','8602 NW 72nd St','Miami','Florida',10007,'USA')

INSERT INTO ship_details VALUES ('AP205917571','8602 NW 72nd St','Miami','Florida',10007,'USA')

INSERT INTO ship_details VALUES ('AP709261784','Ark-Mori Bldg., 30th floor, 1-12-32, Akasaka, Minato-Ku','Harajuku','Tokyo',99687,'Japan')

INSERT INTO ship_details VALUES ('AP683766448','1211 Atlantic Ave, Brooklyn','New York','New York',10001,'USA')

INSERT INTO ship_details VALUES ('AP489980545',' 88 6 ถนน Hemthanon, Pak Nam','Krabi','Krabi',11111,'Thailand')

INSERT INTO ship_details VALUES ('AP754994644','13051 Abercorn St b3','Savannah','Georgia',20674,'USA')

INSERT INTO ship_details VALUES ('AP015517808','115 Kuhl Avenue','Atlanta','Georgia',20674,'USA')

INSERT INTO ship_details VALUES ('AP272864165','1211 Atlantic Ave, Brooklyn','New York','New York',10001,'USA')

INSERT INTO ship_details VALUES ('AP502890303','4232 Balboa Ave','San Diego','California',94027,'USA')

INSERT INTO ship_details VALUES ('AP067056823','4233 Balboa Ave','San Diego','California',94027,'USA')

INSERT INTO ship_details VALUES ('AP895704667','4234 Balboa Ave','San Diego','California',94027,'USA')

INSERT INTO ship_details VALUES ('AP736619231','99 Kuhl Avenue','Atlanta','Georgia',20674,'USA')


--------------------------------
-- order table
--------------------------------
CREATE TABLE orders (
    order_id CHAR(4) PRIMARY KEY,
    order_datetime TIMESTAMP NOT NULL,
    cust_id NUMERIC(5) NOT NULL,
    emp_id VARCHAR(10) NOT NULL,
    pay_type VARCHAR(20) NOT NULL CHECK (pay_type IN ('Cash','Check','Credit Card','Debit Card','Online Banking')),
    shipping_option VARCHAR(40) NOT NULL CHECK (shipping_option IN ('In-store Purchase','Delivery Service','In-store Pickup')),
    ship_id VARCHAR(15),
    FOREIGN KEY (cust_id) references customer (cust_id),
    FOREIGN KEY (emp_id) references employee (emp_id),
    FOREIGN KEY (ship_id) references ship_details (ship_id)
)

INSERT INTO orders VALUES ('A001','10-JUN-2021 13:23',50001,'RE200','Cash','In-store Purchase',NULL)

INSERT INTO orders VALUES ('A002','10-JUN-2021 13:30',50002,'RE200','Check','In-store Purchase',NULL)

INSERT INTO orders VALUES ('A003','10-JUN-2021 14:35',50003,'RE200','Credit Card','In-store Pickup',NULL)

INSERT INTO orders VALUES ('A004','10-JUN-2021 14:44',50004,'RE400','Cash','In-store Purchase',NULL)

INSERT INTO orders VALUES ('A005','10-JUN-2021 14:45',50005,'RE400','Cash','In-store Purchase',NULL)

INSERT INTO orders VALUES ('A006','10-JUN-2021 15:50',50006,'RE400','Credit Card','In-store Pickup',NULL)

INSERT INTO orders VALUES ('A007','10-JUN-2021 15:55',50007,'RE400','Credit Card','In-store Pickup',NULL)

INSERT INTO orders VALUES ('A008','10-JUN-2021 16:56',50008,'RE400','Debit Card','In-store Pickup',NULL)

INSERT INTO orders VALUES ('A009','10-JUN-2021 16:59',50009,'RE400','Online Banking','Delivery Service','AP856665017')

INSERT INTO orders VALUES ('A010','10-JUN-2021 17:00',50010,'RE400','Credit Card','Delivery Service','AP554618648')

INSERT INTO orders VALUES ('A011','11-JUN-2021 10:00',50011,'RE500','Debit Card','Delivery Service','AP452979650')

INSERT INTO orders VALUES ('A012','11-JUN-2021 10:30',50012,'RE500','Online Banking','In-store Pickup',NULL)

INSERT INTO orders VALUES ('A013','11-JUN-2021 15:00',50013,'RE500','Debit Card','In-store Pickup',NULL)

INSERT INTO orders VALUES ('A014','11-JUN-2021 15:30',50014,'RE700','Debit Card','In-store Pickup',NULL)

INSERT INTO orders VALUES ('A015','11-JUN-2021 16:00',50015,'RE700','Check','In-store Purchase',NULL)

INSERT INTO orders VALUES ('A016','12-JUN-2021 11:00',50016,'RE700','Check','In-store Purchase',NULL)

INSERT INTO orders VALUES ('A017','12-JUN-2021 11:45',50017,'RE700','Debit Card','Delivery Service','AP100686842')

INSERT INTO orders VALUES ('A018','12-JUN-2021 15:15',50018,'RE700','Debit Card','Delivery Service','AP223246166')

INSERT INTO orders VALUES ('A019','12-JUN-2021 16:45',50019,'RE200','Cash','In-store Purchase',NULL)

INSERT INTO orders VALUES ('A020','12-JUN-2021 17:55',50020,'RE200','Online Banking','Delivery Service','AP023351107')

INSERT INTO orders VALUES ('A021','12-JUN-2021 17:56',50021,'RE200','Credit Card','In-store Pickup',NULL)

INSERT INTO orders VALUES ('A022','12-JUN-2021 18:01',50022,'RE200','Credit Card','Delivery Service','AP969641900')

INSERT INTO orders VALUES ('A023','12-JUN-2021 18:10',50023,'RE200','Cash','In-store Purchase',NULL)

INSERT INTO orders VALUES ('A024','12-JUN-2021 18:30',50024,'RE1000','Online Banking','Delivery Service','AP736814805')

INSERT INTO orders VALUES ('A025','12-JUN-2021 19:00',50025,'RE1000','Online Banking','Delivery Service','AP783023244')

INSERT INTO orders VALUES ('A026','12-JUN-2021 19:17',50026,'RE1000','Cash','In-store Purchase',NULL)

INSERT INTO orders VALUES ('A027','12-JUN-2021 19:20',50027,'RE1000','Credit Card','In-store Pickup',NULL)

INSERT INTO orders VALUES ('A028','13-JUN-2021 11:00',50028,'RE1000','Online Banking','In-store Pickup',NULL)

INSERT INTO orders VALUES ('A029','13-JUN-2021 11:45',50029,'RE900','Online Banking','Delivery Service','AP229137487')

INSERT INTO orders VALUES ('A030','13-JUN-2021 15:15',50030,'RE900','Cash','In-store Purchase',NULL)

INSERT INTO orders VALUES ('A031','13-JUN-2021 16:45',50031,'RE900','Online Banking','Delivery Service','AP616413099')

INSERT INTO orders VALUES ('A032','13-JUN-2021 17:55',50032,'RE900','Credit Card','Delivery Service','AP940600285')

INSERT INTO orders VALUES ('A033','14-JUN-2021 10:00',50033,'RE500','Check','In-store Purchase',NULL)

INSERT INTO orders VALUES ('A034','14-JUN-2021 10:30',50034,'RE500','Debit Card','Delivery Service','AP805994265')

INSERT INTO orders VALUES ('A035','14-JUN-2021 13:23',50035,'RE500','Debit Card','Delivery Service','AP109615137')

INSERT INTO orders VALUES ('A036','14-JUN-2021 13:30',50036,'RE400','Check','In-store Purchase',NULL)

INSERT INTO orders VALUES ('A037','14-JUN-2021 14:35',50037,'RE400','Online Banking','In-store Pickup',NULL)

INSERT INTO orders VALUES ('A038','14-JUN-2021 14:44',50038,'RE400','Debit Card','In-store Pickup',NULL)

INSERT INTO orders VALUES ('A039','14-JUN-2021 14:45',50039,'RE200','Credit Card','In-store Pickup',NULL)

INSERT INTO orders VALUES ('A040','15-JUN-2021 11:01',50040,'RE200','Credit Card','In-store Pickup',NULL)

INSERT INTO orders VALUES ('A041','15-JUN-2021 11:30',50041,'RE200','Credit Card','Delivery Service','AP489980545')

INSERT INTO orders VALUES ('A042','15-JUN-2021 14:45',50042,'RE200','Debit Card','In-store Pickup',NULL)

INSERT INTO orders VALUES ('A043','15-JUN-2021 15:50',50043,'RE900','Debit Card','Delivery Service','AP067056823')

INSERT INTO orders VALUES ('A044','16-JUN-2021 15:55',50044,'RE900','Credit Card','In-store Pickup',NULL)

INSERT INTO orders VALUES ('A045','16-JUN-2021 16:56',50045,'RE500','Check','In-store Purchase',NULL)

INSERT INTO orders VALUES ('A046','16-JUN-2021 16:59',50046,'RE500','Cash','In-store Purchase',NULL)

INSERT INTO orders VALUES ('A047','16-JUN-2021 18:00',50047,'RE200','Credit Card','In-store Pickup',NULL)

INSERT INTO orders VALUES ('A048','16-JUN-2021 18:10',50048,'RE200','Debit Card','In-store Pickup',NULL)

INSERT INTO orders VALUES ('A049','16-JUN-2021 18:20',50049,'RE200','Debit Card','In-store Pickup',NULL)

INSERT INTO orders VALUES ('A050','17-JUN-2021 12:00',50050,'RE200','Cash','In-store Purchase',NULL)

-----------------------------------
-- order details table
-----------------------------------
CREATE TABLE order_details (
    order_id CHAR(4),
    prod_id NUMERIC(3),
    quantity NUMERIC(1) NOT NULL,
    discount NUMERIC(10, 2),
    PRIMARY KEY (order_id, prod_id),
    FOREIGN KEY (order_id) references orders(order_id),
    FOREIGN KEY (prod_id) references product(prod_id)
)

INSERT INTO order_details VALUES ('A001',111,1,0.1)

INSERT INTO order_details VALUES ('A002',119,2,0.15)

INSERT INTO order_details VALUES ('A003',103,2,0.2)

INSERT INTO order_details VALUES ('A004',120,2,0.1)

INSERT INTO order_details VALUES ('A005',107,3,0.2)

INSERT INTO order_details VALUES ('A006',100,1,0.1)

INSERT INTO order_details VALUES ('A007',112,1,0.3)

INSERT INTO order_details VALUES ('A008',114,4,0.1)

INSERT INTO order_details VALUES ('A009',103,1,0.2)

INSERT INTO order_details VALUES ('A010',117,1,0.2)

INSERT INTO order_details VALUES ('A011',118,2,0.1)

INSERT INTO order_details VALUES ('A012',120,4,0.1)

INSERT INTO order_details VALUES ('A013',102,2,0)

INSERT INTO order_details VALUES ('A014',101,3,0.1)

INSERT INTO order_details VALUES ('A015',113,1,0.1)

INSERT INTO order_details VALUES ('A016',118,2,0.1)

INSERT INTO order_details VALUES ('A017',106,1,0.2)

INSERT INTO order_details VALUES ('A018',100,3,0.1)

INSERT INTO order_details VALUES ('A019',112,1,0.3)

INSERT INTO order_details VALUES ('A020',109,1,0.15)

INSERT INTO order_details VALUES ('A021',108,2,0)

INSERT INTO order_details VALUES ('A022',120,6,0.1)

INSERT INTO order_details VALUES ('A023',119,2,0.15)

INSERT INTO order_details VALUES ('A024',115,1,0.15)

INSERT INTO order_details VALUES ('A025',112,1,0.3)

INSERT INTO order_details VALUES ('A026',103,1,0.2)

INSERT INTO order_details VALUES ('A027',109,4,0.15)

INSERT INTO order_details VALUES ('A028',108,3,0)

INSERT INTO order_details VALUES ('A029',115,2,0.15)

INSERT INTO order_details VALUES ('A030',120,3,0.1)

INSERT INTO order_details VALUES ('A031',100,1,0.1)

INSERT INTO order_details VALUES ('A032',104,1,0)

INSERT INTO order_details VALUES ('A033',106,1,0.2)

INSERT INTO order_details VALUES ('A034',119,1,0.15)

INSERT INTO order_details VALUES ('A035',120,2,0.1)

INSERT INTO order_details VALUES ('A036',108,2,0)

INSERT INTO order_details VALUES ('A037',100,1,0.1)

INSERT INTO order_details VALUES ('A038',112,1,0.3)

INSERT INTO order_details VALUES ('A039',117,1,0.2)

INSERT INTO order_details VALUES ('A040',120,4,0.1)

INSERT INTO order_details VALUES ('A041',105,2,0)

INSERT INTO order_details VALUES ('A042',108,3,0)

INSERT INTO order_details VALUES ('A043',107,2,0.2)

INSERT INTO order_details VALUES ('A044',106,1,0.2)

INSERT INTO order_details VALUES ('A045',111,1,0.1)

INSERT INTO order_details VALUES ('A046',100,1,0.1)

INSERT INTO order_details VALUES ('A047',109,1,0.15)

INSERT INTO order_details VALUES ('A048',103,3,0.2)

INSERT INTO order_details VALUES ('A049',104,1,0)

INSERT INTO order_details VALUES ('A050',117,2,0.2)


CREATE OR REPLACE VIEW stock_view AS
    SELECT ps.prod_id AS "PRODUCT_ID", p.prod_name AS "PRODUCT_NAME", SUM(ps.stock) AS "STOCK"
    FROM product_stock ps
    JOIN product p ON ps.prod_id = p.prod_id
    GROUP BY ps.prod_id, p.prod_name
    ORDER BY ps.prod_id


CREATE OR REPLACE VIEW "EMPLOYEE_VIEW" ("EMP_ID", "EMP_FIRSTNAME", "EMP_SURNAME", "EMP_WORKPLACE_ID", "DATE_HIRED", "EMP_POSITION", "MTH_SALARY") AS 
    SELECT EMPLOYEE.EMP_ID,
           EMPLOYEE.EMP_FIRSTNAME,
           EMPLOYEE.EMP_SURNAME,
           EMPLOYEE.EMP_WORKPLACE_ID,
           EMPLOYEE.DATE_HIRED,
           EMPLOYEE.EMP_POSITION,
           EMPLOYEE.MTH_SALARY 
    FROM EMPLOYEE 
    WHERE EMPLOYEE.DATE_RESIGNED IS NULL


CREATE OR REPLACE VIEW "PRODUCT_SALES_VIEW" ("C_FIRSTNAME", "C_SURNAME", "ORDER_TIMESTAMPTIME", "PROD_NAME", "PROD_UNIT_PRICE", "QUANTITY", "DISCOUNT", "SUBTOTAL") AS 
  select CUSTOMER.C_FIRSTNAME,
         CUSTOMER.C_SURNAME,
         ORDERS.ORDER_TIMESTAMPTIME,
         PRODUCT.PROD_NAME,
         PRODUCT.PROD_UNIT_PRICE,
         ORDER_DETAILS.QUANTITY,
         ORDER_DETAILS.DISCOUNT,
         PROD_UNIT_PRICE * QUANTITY * (1 - DISCOUNT) as SUBTOTAL
    from PRODUCT,ORDER_DETAILS,ORDERS,CUSTOMER
    where PRODUCT.PROD_ID = ORDER_DETAILS.PROD_ID
    and ORDERS.ORDER_ID = ORDER_DETAILS.ORDER_ID
    and CUSTOMER.CUST_ID = ORDERS.CUST_ID
    order by ORDER_TIMESTAMPTIME desc


CREATE OR REPLACE VIEW "MAILSHOT_VIEW" ("MAILSHOT_NAME", "MAILSHOT_START_DATE", "MAILSHOT_END_DATE", "C_FIRSTNAME", "C_SURNAME", "OUTCOME") AS 
SELECT 
    mc.MAILSHOT_NAME,
    mc.MAILSHOT_START_DATE,
    mc.MAILSHOT_END_DATE,
    c.C_FIRSTNAME,
    c.C_SURNAME,
    msc.OUTCOME 
FROM 
    MAILSHOT_CAMPAIGN mc
JOIN 
    MAILSHOT_CUSTOMER msc ON mc.MAILSHOT_ID = msc.MAILSHOT_ID
JOIN 
    APPLE_ACCOUNT aa ON msc.APPLE_ID = aa.APPLE_ID
JOIN 
    CUSTOMER c ON aa.CUST_ID = c.CUST_ID
ORDER BY 
    mc.MAILSHOT_END_DATE DESC
