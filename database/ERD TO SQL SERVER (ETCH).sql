-- DIMENSION TABLES

CREATE TABLE DimCustomer (
    Customer_ID VARCHAR(20) PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50)
);

CREATE TABLE DimProduct (
    Product_Key VARCHAR(20) PRIMARY KEY,
    Product_ID VARCHAR(30),
    Product_Name VARCHAR(255),
    Category VARCHAR(100),
    Sub_Category VARCHAR(100)
);

CREATE TABLE DimOrder (
    Order_ID VARCHAR(30) PRIMARY KEY,
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50)
);

CREATE TABLE DimLocation (
    Location_ID INT IDENTITY(1,1) PRIMARY KEY,
    Postal_Code CHAR(5),
    Country VARCHAR(100),
    State VARCHAR(100),
    City VARCHAR(100),
    Region VARCHAR(100)
);

-- FACT TABLE

CREATE TABLE FactSales (
    Order_ID VARCHAR(30),
    Customer_ID VARCHAR(20),
    Product_Key VARCHAR(20),
    Location_ID INT,
    Sales DECIMAL(18,4),

    CONSTRAINT FK_FactSales_Order
        FOREIGN KEY (Order_ID)
        REFERENCES DimOrder(Order_ID),

    CONSTRAINT FK_FactSales_Customer
        FOREIGN KEY (Customer_ID)
        REFERENCES DimCustomer(Customer_ID),

    CONSTRAINT FK_FactSales_Product
        FOREIGN KEY (Product_Key)
        REFERENCES DimProduct(Product_Key),

    CONSTRAINT FK_FactSales_Location
        FOREIGN KEY (Location_ID)
        REFERENCES DimLocation(Location_ID)
);
GO