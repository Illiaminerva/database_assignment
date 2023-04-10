-- Creating separate tables for Sellers, Buyers, and EstateAgents, and Offices
CREATE TABLE Sellers (
  seller_id INT PRIMARY KEY,
  name VARCHAR(50),
  phone VARCHAR(20),
  email VARCHAR(50)
);

CREATE TABLE Buyers (
  buyer_id INT PRIMARY KEY,
  name VARCHAR(50),
  phone VARCHAR(20),
  email VARCHAR(50)
);

CREATE TABLE EstateAgents (
  agent_id INT PRIMARY KEY,
  name VARCHAR(50),
  phone VARCHAR(20),
  email VARCHAR(50)
);

CREATE TABLE Offices (
  office_id INT PRIMARY KEY,
  name VARCHAR(50),
  phone VARCHAR(20),
  email VARCHAR(50)
);

--After each of the tables were created, we can create a table Houses where we can store
--information about houses and their selling information via foreign keys
CREATE TABLE Houses (
  house_id INT PRIMARY KEY,
  seller_id INT,
  num_bedrooms INT,
  num_bathrooms INT,
  list_price INT,
  zip_code VARCHAR(10),
  list_date DATE,
  list_agent_id INT,
  office_id INT,
  buyer_id INT,
  sale_price INT,
  sale_date DATE,
  sell_agent_id INT,
  status VARCHAR(10),
  FOREIGN KEY (seller_id) REFERENCES Sellers(seller_id),
  FOREIGN KEY (list_agent_id) REFERENCES EstateAgents(agent_id),
  FOREIGN KEY (office_id) REFERENCES Offices(office_id),
  FOREIGN KEY (buyer_id) REFERENCES Buyers(buyer_id),
  FOREIGN KEY (sell_agent_id) REFERENCES EstateAgents(agent_id)
);