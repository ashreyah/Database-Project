CREATE DATABASE cis395_proj;
USE cis395_proj;

-- Vegan Restaurant Database

-- Drop tables if they exist (for testing purposes)
DROP TABLE IF EXISTS CustomerAllergies;
DROP TABLE IF EXISTS CustomerEvents;
DROP TABLE IF EXISTS Reservations;
DROP TABLE IF EXISTS MenuItemIngredients;
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Ingredients;
DROP TABLE IF EXISTS Eventss;
DROP TABLE IF EXISTS Menu;
DROP TABLE IF EXISTS Allergies;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Categories;

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15),
    CardNumber VARCHAR(16) NOT NULL, -- Assuming card number as a string for simplicity
    ExpiryDate DATE NOT NULL,
    CVV VARCHAR(3) NOT NULL
    -- Additional fields as necessary
);

-- Create Allergies Table
CREATE TABLE Allergies (
    AllergyID INT PRIMARY KEY AUTO_INCREMENT,
    AllergyName VARCHAR(255),
    Description TEXT
);

-- Create CustomerAllergies Table (junction table for Customers and Allergies)
CREATE TABLE CustomerAllergies (
    CustomerID INT,
    AllergyID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (AllergyID) REFERENCES Allergies(AllergyID),
    PRIMARY KEY (CustomerID, AllergyID)
);

-- Create Categories Table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(50) NOT NULL
);

-- Create MenuItems Table
CREATE TABLE MenuItems (
    ItemID INT PRIMARY KEY AUTO_INCREMENT,
    ItemName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    Vegan BOOLEAN,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Create Ingredients Table
CREATE TABLE Ingredients (
    IngredientID INT PRIMARY KEY AUTO_INCREMENT,
    IngredientName VARCHAR(50) NOT NULL,
    IsAllergen BOOLEAN
);

-- Create MenuItemIngredients Table (junction table for MenuItems and Ingredients)
CREATE TABLE MenuItemIngredients (
    ItemID INT,
    IngredientID INT,
    FOREIGN KEY (ItemID) REFERENCES MenuItems(ItemID),
    FOREIGN KEY (IngredientID) REFERENCES Ingredients(IngredientID),
    PRIMARY KEY (ItemID, IngredientID)
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    OrderStatus VARCHAR(20) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create OrderItems Table
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES MenuItems(ItemID)
);

-- Create Events Table
CREATE TABLE Eventss (
    EventID INT PRIMARY KEY AUTO_INCREMENT,
    EventName VARCHAR(100) NOT NULL,
    Description TEXT,
    Date DATE NOT NULL,
    Time TIME NOT NULL
);

-- Create CustomerEvents Table (junction table for Customers and Events)
CREATE TABLE CustomerEvents (
    CustomerID INT,
    EventID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EventID) REFERENCES Eventss(EventID),
    PRIMARY KEY (CustomerID, EventID)
);

-- Create Reservations Table
CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    EventID INT,
    ReservationDate DATE NOT NULL,
    NumberOfGuests INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EventID) REFERENCES Eventss(EventID)
);

-- Inserting mock data into the Vegan Mexican Restaurant database

-- Categories
INSERT INTO Categories (CategoryName) VALUES
  ('Appetizers'),
  ('Tacos'),
  ('Enchiladas'),
  ('Desserts'),
  ('Beverages');

-- Ingredients
INSERT INTO Ingredients (IngredientName, IsAllergen) VALUES
  ('Avocado', FALSE),
  ('Black Beans', FALSE),
  ('Corn Tortillas', TRUE),
  ('Lime', FALSE),
  ('Cilantro', FALSE),
  ('Salsa', FALSE),
  ('Vegan Cheese', FALSE),
  ('Guacamole', FALSE),
  ('Corn Chips', FALSE),
  ('Chocolate', TRUE),
  ('Agave Syrup', FALSE),
  ('Chili Powder', FALSE),
  ('Jackfruit', FALSE),
  ('Rice', FALSE),
  ('Tomatoes', FALSE),
  ('Onions', FALSE),
  ('Garlic', FALSE),
  ('Vegan Sour Cream', FALSE),
  ('Mango', FALSE),
  ('Coconut Milk', TRUE);

-- MenuItems
INSERT INTO MenuItems (ItemName, Description, Price, Vegan, CategoryID) VALUES
  ('Guacamole and Chips', 'Fresh guacamole served with corn chips', 8.99, TRUE, 1),
  ('Jackfruit Tacos', 'Soft tacos filled with seasoned jackfruit and toppings', 12.99, TRUE, 2),
  ('Vegan Enchiladas', 'Corn tortillas stuffed with black beans and topped with salsa', 10.99, TRUE, 3),
  ('Chocolate Avocado Mousse', 'Creamy chocolate mousse made with avocado', 6.99, TRUE, 4),
  ('Horchata', 'Traditional rice milk beverage with cinnamon', 3.99, TRUE, 5);

-- Customers
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, CardNumber, ExpiryDate, CVV) VALUES
  ('Maria', 'Rodriguez', 'maria@email.com', '555-1234', '1234567812345678', '2025-12-31', '123'),
  ('Carlos', 'Hernandez', 'carlos@email.com', '555-5678', '2345678923456789', '2024-08-31', '456'),
  ('Elena', 'Chavez', 'elena@email.com', '555-9876', '3456789034567890', '2023-06-30', '789');

-- Allergies
INSERT INTO Allergies (AllergyName, Description) VALUES
  ('Nuts', 'Allergic to nuts'),
  ('Soy', 'Allergic to soy'),
  ('Gluten', 'Gluten intolerance'),
  ('Jalapenos', 'Sensitive to jalapenos');

-- CustomerAllergies
INSERT INTO CustomerAllergies (CustomerID, AllergyID) VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (2, 4),
  (3, 2),
  (3, 3);

-- Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, OrderStatus) VALUES
  (1, '2023-04-05', 32.97, 'Fulfilled'),
  (2, '2023-04-06', 21.98, 'Processing'),
  (3, '2023-04-07', 43.96, 'Processing');

-- OrderItems
INSERT INTO OrderItems (OrderID, ProductID, Quantity, Subtotal) VALUES
  (1, 2, 2, 25.98),
  (1, 4, 1, 6.99),
  (2, 3, 3, 26.97),
  (3, 1, 1, 10.99),
  (3, 5, 2, 21.98);

-- Events
INSERT INTO Eventss (EventName, Description, Date, Time) VALUES
  ('Taco Tuesday Fiesta', 'Celebrate with a variety of vegan tacos!', '2023-04-10', '18:30'),
  ('Mexican Dessert Night', 'Indulge in delicious vegan Mexican desserts.', '2023-04-15', '19:00');

-- Reservations
INSERT INTO Reservations (CustomerID, EventID, ReservationDate, NumberOfGuests) VALUES
  (1, 1, '2023-04-10', 2),
  (2, 2, '2023-04-15', 3),
  (3, 1, '2023-04-10', 4);
  
  -- CustomerEvents table
INSERT INTO CustomerEvents (CustomerID, EventID) VALUES
  (1, 1),
  (2, 2);
  
-- Insert a new customer
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, CardNumber, ExpiryDate, CVV)
VALUES ('Laura', 'Johnson', 'laura@email.com', '555-1111', '4567890145678901', '2024-10-31', '234');

-- Insert a new allergy
INSERT INTO Allergies (AllergyName, Description)
VALUES ('Lactose Intolerance', 'Intolerant to lactose');

select * from customers;
select * from allergies;
select * from customerallergies;
select * from menuitems;

-- Associate the new customer with the new allergy
INSERT INTO CustomerAllergies (CustomerID, AllergyID)
VALUES ((SELECT CustomerID FROM Customers WHERE FirstName = 'Laura' AND LastName = 'Johnson'),
        (SELECT AllergyID FROM Allergies WHERE AllergyName = 'Lactose Intolerance'));

-- Insert a new menu item
INSERT INTO MenuItems (ItemName, Description, Price, Vegan, CategoryID)
VALUES ('Chili Mango Salad', 'Spicy mango salad with chili lime dressing', 11.99, TRUE, 1);

-- Insert a new order for the new customer
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, OrderStatus)
VALUES ((SELECT CustomerID FROM Customers WHERE FirstName = 'Laura' AND LastName = 'Johnson'),
        '2023-04-10', 11.99, 'Processing');

SET SQL_SAFE_UPDATES = 0;
-- Update Laura Johnson's phone number
UPDATE Customers
SET PhoneNumber = '555-2222'
WHERE FirstName = 'Laura' AND LastName = 'Johnson';


select * from orders; 
-- Update the order status for Laura Johnson's order
UPDATE Orders
SET OrderStatus = 'Fulfilled'
WHERE CustomerID = (SELECT CustomerID FROM Customers WHERE FirstName = 'Laura' AND LastName = 'Johnson')
  AND OrderDate = '2023-04-10';
  
 -- Insert a new menu item
INSERT INTO MenuItems (ItemName, Description, Price, Vegan, CategoryID) VALUES
  ('Vegan Burrito', 'Spicy black beans, guacamole, and vegan cheese wrapped in a tortilla', 14.99, TRUE, 2);
  
  -- Delete Laura Johnson's order
DELETE FROM Orders
WHERE CustomerID = (SELECT CustomerID FROM Customers WHERE FirstName = 'Laura' AND LastName = 'Johnson')
  AND OrderDate = '2023-04-10';

-- Delete Laura Johnson's allergy association
DELETE FROM CustomerAllergies
WHERE CustomerID = (SELECT CustomerID FROM Customers WHERE FirstName = 'Laura' AND LastName = 'Johnson');

-- Delete Laura Johnson's allergy
DELETE FROM Allergies
WHERE AllergyName = 'Lactose Intolerance';

-- Delete Laura Johnson's customer record
DELETE FROM Customers WHERE  CustomerID = 4;

-- Added index to the email column 
CREATE INDEX idx_email ON Customers (Email);

-- Added index to the CardNumber column
CREATE INDEX idx_card_number ON Customers (CardNumber);

-- Added index to the AllergyName column 
CREATE INDEX idx_allergy_name ON Allergies (AllergyName);

-- Added indexes to the CustomerID and AllergyID columns for efficient lookups
CREATE INDEX idx_customer_id ON CustomerAllergies (CustomerID);
CREATE INDEX idx_allergy_id ON CustomerAllergies (AllergyID);

-- Added index to the ItemName column
CREATE INDEX idx_item_name ON MenuItems (ItemName);

-- Added index to the CategoryID column for efficient lookups
CREATE INDEX idx_category_id ON MenuItems (CategoryID);

-- Add indexes to the ItemID and IngredientID columns for efficient lookups
CREATE INDEX idx_item_id ON MenuItemIngredients (ItemID);
CREATE INDEX idx_ingredient_id ON MenuItemIngredients (IngredientID);

-- Add indexes to the CustomerID and OrderDate columns for efficient lookups
CREATE INDEX idx_customer_id_orders ON Orders (CustomerID);
CREATE INDEX idx_order_date ON Orders (OrderDate);

-- Add indexes to the OrderID and ProductID columns for efficient lookups
CREATE INDEX idx_order_id_order_items ON OrderItems (OrderID);
CREATE INDEX idx_product_id ON OrderItems (ProductID);

-- Add indexes to the EventName column since it is often used for searching
CREATE INDEX idx_event_name ON Eventss (EventName);

-- Add index to the Date column 
CREATE INDEX idx_date ON Events (Date);

-- Add indexes to the CustomerID and EventID columns for efficient lookups
CREATE INDEX idx_customer_id_reservations ON Reservations (CustomerID);
CREATE INDEX idx_event_id ON Reservations (EventID);

