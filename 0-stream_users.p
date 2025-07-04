import mysql.connector

def stream_users():
    # Connect to MySQL ALX_prodev database
    conn = mysql.connector.connect(
        host='localhost',
        user='root',
        password='',  # Put your MySQL password here if you have one
        database='ALX_prodev'
    )
    cursor = conn.cursor(dictionary=True)  # Return rows as dictionaries

    cursor.execute("SELECT * FROM user_data")

    # Only one loop to fetch and yield each row one by one
    row = cursor.fetchone()
    while row:
        yield row
        row = cursor.fetchone()

    cursor.close()
    conn.close()
