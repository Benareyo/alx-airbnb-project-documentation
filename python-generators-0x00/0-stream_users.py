import mysql.connector

def connect_to_prodev():
    try:
        conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='',
            database='ALX_prodev'
        )
        return conn
    except mysql.connector.Error as err:
        print("Cannot connect to ALX_prodev:", err)
        return None

def stream_users():
    connection = connect_to_prodev()
    if connection is None:
        return

    cursor = connection.cursor(dictionary=True)
    cursor.execute("SELECT * FROM user_data")

    for row in cursor:
        yield row

    cursor.close()
    connection.close()
