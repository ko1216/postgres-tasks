import psycopg2
from dotenv import load_dotenv
import os

load_dotenv()
PASSWORD: str = os.getenv('PASSWORD')


def open_data(filename: str):
    data_path = os.path.join(os.path.dirname(__file__), 'north_data', filename)

    with open(data_path) as f:
        content = f.read().splitlines()
    return content


with psycopg2.connect(
    host='localhost',
    database='north',
    user='postgres',
    password=PASSWORD
) as conn:
    with conn.cursor() as cur:
        count = 0
        customers_values_list = []
        employees_values_list = []
        orders_values_list = []

        for row in open_data('customers_data.csv'):
            row_list = row.strip('"').split('","')
            customers_values_list.append(row_list)

        for val in customers_values_list:
            if count == 0:
                count += 1
                continue
            cur.execute('INSERT INTO customers VALUES (%s, %s, %s)', (val[0], val[1], val[2]))

        for row in open_data('employees_data.csv'):
            row_list = row.split(',"')
            clear_row_list = []
            for value in row_list:
                clear_row_list.append(value.replace('"', ''))
            employees_values_list.append(clear_row_list)

        for val in employees_values_list:
            if count == 1:
                count += 1
                continue
            cur.execute('INSERT INTO employees VALUES (%s, %s, %s, %s, %s, %s)', (val[0], val[1], val[2], val[3],
                                                                                  val[4], val[5]))

        for row in open_data('orders_data.csv'):
            row_list = row.replace('"', '').split(',')
            orders_values_list.append(row_list)

        for val in orders_values_list:
            if count == 2:
                count += 1
                continue
            cur.execute('INSERT INTO orders VALUES (%s, %s, %s, %s, %s)', (val[0], val[1], val[2], val[3], val[4]))

conn.close()
