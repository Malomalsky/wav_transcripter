import logging
from sys import stdout

api_key = '****'
secret_key = '****' 


# Конфиг декодера аудио
audio_config = {
    "encoding": "LINEAR16",
    "sample_rate_hertz":8000,
    "num_channels": 1
}


# Фразы позитивных/негативных реакций. 
positive = [' да ', 'ну да', 'конечно', 'удобно', 'слушаю', 'говорите', 'могу', 'окей']
negative = ['нет', 'свидания', 'не удобно', 'неудобно']

# Настройки логгера. 
logging.basicConfig(handlers=[logging.FileHandler(filename="script.log", encoding='utf-8', mode='a')], format='%(asctime)s - %(message)s', datefmt='%d-%b-%y %H:%M:%S', level=logging.INFO)

# Для формирования сообщения логов. 
auto = {0:'АО', 1:'человек'}

# Конфиг логера loguru
log_config = {
    "handlers": [
        {
            "sink": stdout, 
            "format": "{time:YYYY-MM-DD HH:mm:ss.SSS} - {level}",
            "level": "ERROR",
            "backtrace" : False
        },
        {
            "sink": "error.log",
            "format": "\n{time:YYYY-MM-DD HH:mm:ss.SSS} - {level} - {message}",
            "level": "ERROR", 
            "encoding":'utf-8'
        },
    ]}