import psycopg2
from time import strftime


# Конфигурация соединения с БД.
conn_conf = {
    "dbname": '',
    "user": '',
    "password": '',
    "host": ''
}

# Название таблицы.
table_name = 'transcription'


def insert(uid, rs, ph, dr, tx):
    """Вставляет данные в БД. Дату и время генерирует самостоятельно."""
    dt = strftime("%d-%b-%y")
    tm = strftime("%H:%M:%S")
    conn = psycopg2.connect(**conn_conf)
    cursor = conn.cursor()
    cursor.execute(f"INSERT INTO {table_name} VALUES ('{dt}', '{tm}', '{uid}', '{rs}', '{ph}', '{dr}', '{tx}')")
    conn.commit()
    conn.close()
