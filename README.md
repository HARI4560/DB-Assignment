# DB-Assignment

1. Explain the relationship between the "Product" and "Product_Category" entities from the above diagram. <br>
Ans:<br>
The product table has a foreign key attribute called category_id. This indicates a one-to-many relationship between the product table (many products) and the product_category table (one category).
Each product is associated with a single category, but a category can have multiple products.<br><br>

2. How could you ensure that each product in the "Product" table has a valid category assigned to it?<br>
Ans:<br>
we have to define a foreign key constraint between the category_id column in the “Product” table and the id column in the “Product Category” table.
This constraint ensures that any value entered in the category_id column of the “Product” table must exist as a valid id in the “Product Category” table.
If an attempt is made to insert or update a product with an invalid category ID, the database will raise an error, preventing inconsistent data.
