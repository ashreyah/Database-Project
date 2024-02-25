<h1>Resturant Database</h1>


<h2>Description</h2>
I created a vegan restaurant recommender website/app and was inspired to create a database for one of the restaurants on the site. The vegan Mexican restaurant database is designed to manage the operations of a fictional vegan restaurant specializing in Mexican cuisine. It includes tables to store information about customers, allergies, menu items, ingredients, orders, events, reservations, and more. The database was created using MySQL. 
<br />
The database was created using ER Model and SQL scripts executed in MySQL Workbench. The structure includes primary and foreign key relationships to maintain data integrity. Indexing is used to enhance query performance, especially for common search and association operations.
<br />

<h2>Languages and Utilities Used</h2>

- <b>MySQL</b> 

<h2>Environments Used </h2>

- <b>Windows 10</b>
- <b>MySQL Workbench</b>

<h2>Database Structure:</h2>

 <b>Customers Table:</b>
 <p>
    •	Stores customer information such as name, contact details, and card information. <br />
    •	Indexes on the email and card number columns for efficient searches.<br />
 </p>
 <b>Allergies Table:</b>
 <p>
    	•	Contains information about allergies, including the name and description. <br />
     •	Indexed on the allergy name for quick lookups.<br />
 </p>
 <b>CustomerAllergies Table:</b>
 <p>
    	•	A junction table linking customers to their allergies. <br />
     •	Indexed on both the customer ID and allergy ID for efficient association lookups.<br />
 </p>
 <b>CustomerAllergies Table:</b>
 <p>
    	•	A junction table linking customers to their allergies. <br />
     •	Indexed on both the customer ID and allergy ID for efficient association lookups.<br />
 </p>
 <b>MenuItems Table:</b>
 <p>
    	•	Manages menu items with details like name, description, price, and category. <br />
     •	Indexed on item name and category ID for search and category-based queries. <br />
 </p> 
 <b>Ingredients Table:</b>
 <p>
    	• Contains information about ingredients used in menu items. <br />
     •	Indexed on the IngredientName column for optimized ingredient searches. <br />
 </p>
 <b>MenuItemIngredients Table:</b>
 <p>
     • A junction table linking menu items to their ingredients. <br />
     •	Indexed on both the item ID and ingredient ID for efficient association lookups. <br />
 </p>
 <b>Orders Table:</b>
 <p>
     • Tracks customer orders with details like order date, total amount, and order status. <br />
     •	Indexed on customer ID and order date for efficient order-related queries. <br />
 </p>
 <b>Order Items Table:</b>
 <p>
     • Records items included in each order with details like quantity and subtotal. <br />
     •	Indexed on order ID and product ID for quick order item lookups. <br />
 </p>
 <b>Events Table:</b>
 <p>
     • Manages events with information such as event name, description, date, and time. <br />
     •	Indexed on event name and date for efficient event-related queries. <br />
 </p>
 <b>Reservations Table:</b>
 <p>
     • Tracks customer reservations for events, including the number of guests and reservation date. <br />
     •	Indexed on customer ID and event ID for quick reservation lookups. <br />
 </p>
<!--
 ```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```
--!>
