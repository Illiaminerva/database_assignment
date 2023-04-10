# Database assignment
This assignment is intended to build a database system for a large real estate company with SQL. Here are the files and their explanations that were included in this assignment:

*create.sql*

This SQL file helps us to create appropriate tables for our database. Within this file, these are the tables and their purposes:
- Sellers: store information about house sellers, such as seller's id, name, phone, and email address.
- Buyers: store information about house buyers, such as buyer's id, name, phone, and email address.
- EstateAgents: a table with information about a person's agent id, name, phone, and email address.
- Offices: a table that contains information about the office id of the company, their name, phone, and email address.

After we have created all of these tables, we can create a Houses table that will store information about houses' selling information. This table includes such information as house id, seller id(foreign key to Sellers), number of bedrooms, number of bathrooms, listing price, zip code, listing date, listing agent id(foreign key to EstateAgents), office id (foreign key to Offices), buyer id (foreign key to Buyers), sale price, sale date, seller agent id (foreign key to EstateAgents), status.

*insert_data.sql*

This file contains all the necessary SQL INSERT statements that need to be written to test our database system. These statements were produced with the Faker library in Python via the Python file that will be specified later.

*query_data.sql*

- This file contains all the needed code to perform the query questions mentioned in the assignment. The SQL code is going in the blocks in the following order:
- Find the top 5 offices with the most sales for that month.
- Find the top 5 estate agents who have sold the most for the month (include their contact details and their sales details so that it is easy contact them and congratulate them).
- Calculate the commission that each estate agent must receive and store the results in a separate table.
- For all houses that were sold that month, calculate the average number of days on the market.
- For all houses that were sold that month, calculate the average selling price.

*fake_data.py*

This file allows us to generate a lot of data for our assignments. Within this file, I generated 10 INSERT statements for the Offices table, 10 INSERT statements for the EstateAgents table, 10 INSERT statements for the Buyers table, 10 INSERT statements for the Sellers table, and 100 INSERT statements for the Houses table. Once the program runs, I copy its output and put it into insert_data.sql. If you want to have your personalized data, you can run the code on your own and paste the result instead of the INSERT statements that are mentioned in the insert_data.sql file.

In order to make the database work, here is the sequence of the steps that need to be taken:

- Open the folder with all the necessary files
- Create a "database.db" file
- Go to the terminal and type sqlite3 database.db (while being in the appropriate folder)
- Do the following commands:
- .read create.sql
- .read insert_data.sql
- .read query_data.sql

If you want to create your own fake data, you can run the file fake_data.py; however, you will need to install the Faker library first. For whatever is specified above, no more installations are required (if sqlite3 was already installed).
