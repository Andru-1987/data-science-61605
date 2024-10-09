CREATE    TABLE Customers (
          CustomerID INTEGER
        , CustomerName VARCHAR(40)
        , ContactName VARCHAR(40)
        , Address VARCHAR(45)
        , City VARCHAR(25)
        , PostalCode VARCHAR(15)
        , Country VARCHAR(25)
          );


INSERT    INTO Customers (
          CustomerID
        , CustomerName
        , ContactName
        , Address
        , City
        , PostalCode
        , Country
          )
VALUES    (
          1
        , 'John Doe'
        , 'Jane Doe'
        , '123 Main Street'
        , 'Anytown'
        , '12345'
        , 'argentina'
          )
        , (
          2
        , 'Jane Doe'
        , 'John Doe'
        , '456 Elm Street'
        , 'Anytown'
        , '12345'
        , 'USA'
          )
        , (
          3
        , 'John Smith'
        , 'Jane Smith'
        , '789 Oak Street'
        , 'Anytown'
        , '12345'
        , 'USA'
          );


DROP      TABLE Customers
CREATE    TABLE Customers (
          CustomerID INTEGER AUTO_INCREMENT PRIMARY KEY
        , CustomerName VARCHAR(40)
        , ContactName VARCHAR(40)
        , Address VARCHAR(45)
        , City VARCHAR(25)
        , PostalCode VARCHAR(15)
        , Country VARCHAR(25) UNIQUE
          ) AUTO_INCREMENT = 10;


INSERT    INTO Customers (
          CustomerName
        , ContactName
        , Address
        , City
        , PostalCode
        , Country
          )
VALUES    (
          'John Doe'
        , 'Jane Doe'
        , '123 Main Street'
        , 'Anytown'
        , '12345'
        , NULL
          )
        , (
          'Jane Doe'
        , 'John Doe'
        , '456 Elm Street'
        , 'Anytown'
        , '12345'
        , 'USA'
          )
        , (
          'John Smith'
        , 'Jane Smith'
        , '789 Oak Street'
        , 'Anytown'
        , '12345'
        , 'ARGENTINA'
          );


SELECT    *
FROM      Customers;


SELECT    CustomerID
        , CustomerName
        , Address
FROM      Customers
WHERE     customerid = 1;


DROP      TABLE Customers;


UPDATE    Customers
SET       City = "Orlando"
WHERE     CustomerID = 1;


DROP      TABLE Customers;


CREATE    TABLE Customers (
          CustomerID INTEGER CHECK (CustomerID > 0)
        , CustomerName VARCHAR(40)
        , ContactName VARCHAR(40) NOT NULL
        , Address VARCHAR(45)
        , City VARCHAR(25)
        , PostalCode VARCHAR(15)
        , Country VARCHAR(25)
        , PRIMARY KEY (CustomerID)
          );


ALTER     TABLE Customers
MODIFY    COLUMN CustomerName VARCHAR(55) NOT NULL
        , MODIFY    COLUMN ContactName VARCHAR(45) NOT NULL
        , MODIFY    COLUMN Address VARCHAR(45) NOT NULL
        , MODIFY    COLUMN City VARCHAR(45) NOT NULL
        , MODIFY    COLUMN PostalCode INTEGER NOT NULL
        , MODIFY    COLUMN Country VARCHAR(25) NOT NULL;


ALTER     TABLE Customers
MODIFY    COLUMN Country VARCHAR(25) NOT NULL DEFAULT 'Canada';


INSERT    INTO Customers (
          customerid
        , CustomerName
        , ContactName
        , Address
        , City
        , PostalCode
        , Country
          )
VALUES    (
          10
        , 'JORGE Doe'
        , 'Jane Doe'
        , '123 Main Street'
        , 'Anytown'
        , '12345'
        , DEFAULT
          );


TRUNCATE  TABLE Customers;


ALTER     TABLE Customers
ADD       EMAIL VARCHAR(20);


SELECT    CustomerID
        , CustomerName
        , Address
FROM      Customers;


SELECT    CustomerID
        , CustomerName
        , Address
FROM      Customers
WHERE     customerid = 10;


UPDATE    Customers
SET       customername = 'Alfred Schmidt'
WHERE     CustomerId = 1;


DELETE    FROM Customers
WHERE     CustomerId = 1;
