from faker import Faker
import random
from datetime import date
# Create a faker object
fake = Faker()
# Generate 10 fake offices and insert them into the database
for i in range(10):
    print(f"INSERT INTO Offices (office_id, name, phone, email) VALUES ({i+1}, '{fake.company()}', '{fake.phone_number()}', '{fake.email()}');")
# Generate 10 fake estate agents and insert them into the database
for i in range(10):
    print(f"INSERT INTO EstateAgents (agent_id, name, phone, email) VALUES ({i+1}, '{fake.name()}', '{fake.phone_number()}', '{fake.email()}');")
# Generate 100 fake buyers and insert them into the database
for i in range(10):
    print(f"INSERT INTO Buyers (buyer_id, name, phone, email) VALUES ({i+1}, '{fake.name()}', '{fake.phone_number()}', '{fake.email()}');")
# Generate 100 fake sellers and insert them into the database
for i in range(10):
    print(f"INSERT INTO Sellers (seller_id, name, phone, email) VALUES ({i+1}, '{fake.name()}', '{fake.phone_number()}', '{fake.email()}');")
# Generate 100 fake houses and insert them into the database
for i in range(100):
  house_id = i+1
  seller_id = random.randint(1, 10)
  num_bedrooms = random.randint(1, 5)
  num_bathrooms = random.randint(1, 5)
  list_price = random.randint(100000, 1000000)
  zip_code = fake.zipcode()
  list_date = fake.date_between(start_date='-1y', end_date='today')
  list_agent_id = random.randint(1, 10)
  office_id = random.randint(1, 10)
  buyer_id = random.randint(1, 10)
  sale_price = random.randint(100000, 1000000)
  today = date.today()
  sale_date = fake.date_between_dates(date_start=list_date, date_end=today)
  sell_agent_id = random.randint(1, 10)
  status = 'Sold'

    # Insert the house data into the database
  print(f"INSERT INTO Houses (house_id, seller_id, num_bedrooms, num_bathrooms, list_price, zip_code, list_date, list_agent_id, office_id, buyer_id, sale_price, sale_date, sell_agent_id, status) VALUES ({house_id}, {seller_id}, {num_bedrooms}, {num_bathrooms}, {list_price}, '{zip_code}', '{list_date}', {list_agent_id}, {office_id}, {buyer_id}, {sale_price}, '{sale_date}', {sell_agent_id}, '{status}');")
