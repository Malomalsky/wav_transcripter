import logging
import uuid

import click
from loguru import logger as log
from tinkoff_voicekit_client import ClientSTT

from config import *
from dbwork import *

# Логгер для ошибок.
log.configure(**log_config)
client = ClientSTT(api_key, secret_key)

# Парсим командную строку. Единственный опциональный параметр - флаг записи в бд. (True по умолчанию)
@log.catch
@click.command()
@click.argument('path')
@click.argument('phone-number')
@click.option('--db-write','-d', default=True, help='False если запись в БД не нужна.')
@click.argument('step') 
def main(path, phone_number, db_write, step):
    try:
        response = client.recognize(path, audio_config)
        text = response[0]['alternatives'][0]['transcript']   # Распознанный текст. 
    except ValueError: 
        click.echo('Попробуйте указать правильный путь до wav-файла.')
        exit()
    
    uid = uuid.uuid1()

    # Этап 1.
    if step == '1':  # Проверка на автоответчик
        click.echo(f"\nФайл {path} проходит обработку на автоответчик.")
        result = 0 if 'автоответчик' in text else 1 
        if result:
            click.echo('-->Распознан реальный человек.')
        else:
            click.echo('-->Распознан автоответчик.')
        if db_write:
            insert(str(uid), auto[result], phone_number, response[0]['end_time'], text)  
        logging.info(u' - '.join([str(uid), auto[result], phone_number,response[0]['end_time'], text])) # Логи
        return result  # Возвращает 0 если АО, 1 - если человек.
     
        # Этап 2.
    elif step == '2':  # Проверка на положительный/отрицательный ответ.
        # С помощью listcomp ищем вхождения положительных/отрицательных реакций в сообщение.
        click.echo(f"\nФайл {path} проходит обработку на положительную/отрицательную реакцию.")
        pos = bool([word for word in positive if word in text])
        neg = bool([word for word in negative if word in text])
        if pos:
            click.echo('-->Положительный ответ.')
            if db_write:
                insert(str(uid), 'положительно', phone_number, response[0]['end_time'], text)
            logging.info(u' - '.join([str(uid), 'положительно', phone_number,response[0]['end_time'], text]))
            return 1
        elif neg:
            click.echo('-->Отрицательный ответ.')
            if db_write:
                insert(str(uid), 'отрицательно', phone_number,response[0]['end_time'], text)
            logging.info(u' - '.join([str(uid), 'отрицательно', phone_number,response[0]['end_time'], text]))
            return 0




if __name__=='__main__':
    main()
