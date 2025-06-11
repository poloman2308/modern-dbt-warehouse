import pandas as pd
import random
from faker import Faker
from datetime import timedelta

fake = Faker()
Faker.seed(42)

# Customers
customers = []
for i in range(1, 501):
    customers.append({
        "customer_id": i,
        "first_name": fake.first_name(),
        "last_name": fake.last_name(),
        "email": fake.email(),
        "created_at": fake.date_between(start_date='-3y', end_date='-1y'),
        "updated_at": fake.date_between(start_date='-1y', end_date='today')
    })
pd.DataFrame(customers).to_csv(r"C:\\Users\\Owner\\modern_dbt_warehouse\\data\\customers.csv", index=False)

# Products
products = []
for i in range(1, 51):
    products.append({
        "product_id": i,
        "product_name": fake.word().capitalize(),
        "price": round(random.uniform(5, 500), 2),
        "category": random.choice(['Electronics', 'Apparel', 'Home', 'Beauty', 'Sports']),
        "created_at": fake.date_between(start_date='-3y', end_date='-2y')
    })
pd.DataFrame(products).to_csv(r"C:\\Users\\Owner\\modern_dbt_warehouse\\data\\products.csv", index=False)

# Orders
orders = []
for i in range(1, 1001):
    customer = random.choice(customers)
    orders.append({
        "order_id": i,
        "customer_id": customer["customer_id"],
        "product_id": random.randint(1, 50),
        "quantity": random.randint(1, 5),
        "order_date": fake.date_between(start_date='-1y', end_date='today'),
        "status": random.choice(['completed', 'pending', 'shipped', 'cancelled'])
    })
pd.DataFrame(orders).to_csv(r"C:\\Users\\Owner\\modern_dbt_warehouse\\data\\orders.csv", index=False)
