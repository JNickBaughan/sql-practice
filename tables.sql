
--CREATE an address table, with auto increment id, st num, st name, city, state
CREATE TABLE Address (
    AddressID INT IDENTITY(1,1) PRIMARY KEY,
    StreetNumber VARCHAR(255),
    StreetName VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255)
);



--CREATE a person table, with auto increment id, first and last name, addressID foreign key
CREATE TABLE Persons (
    PersonID INT IDENTITY(1,1) PRIMARY KEY,
    LastName VARCHAR(255),
    FirstName VARCHAR(255),
    AddressID INT FOREIGN KEY REFERENCES Address(AddressID)
);

--INSERT an address record
INSERT INTO Address (StreetNumber, StreetName, City, State)
VALUES ('5000', 'Main St', 'Richmond', 'VA')

--INSERT person record attached to address
INSERT INTO Persons (FirstName, LastName, AddressID)
VALUES ('John', 'Doe', 1)

--JOIN all persons to their address
SELECT *
FROM Persons P WITH(NOLOCK)
RIGHT JOIN Address A WITH(NOLOCK)
ON A.AddressID = P.AddressID

--SELECT all addresses with the count of people
SELECT COUNT(P.PersonID) as Count, A.streetNumber, A.streetName
FROM Address A WITH(NOLOCK)
LEFT JOIN Persons P WITH(NOLOCK)
ON A.AddressID = P.AddressID
GROUP BY A.AddressID, A.streetNumber, A.streetName

--DELETE both tables, recreate them but where a person can have multiple addresses

--INSERT new records

--SELECT all people and their count of addresses