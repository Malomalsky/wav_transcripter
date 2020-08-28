# Тестовое задание компании X-LAB. 
## 1 этап: установка зависимостей.
После загрузки репозитория на локальный диск первым делом необходимо установить все требуемые пакеты. Для этого: 
* открыть консоль в папке со скриптом
* ввести команду: 

```
pip install -r requirements.txt
```
## 2 этап.  Настройка конфигураций. 
Для работы скрипта необходимо настроить такие вещи, как api_key, secret_key, а также конфигурацию подключения к БД Postgres. 
Откройте *config.py* и введите соответсвующие ключи: 

![API CONFIG](https://raw.githubusercontent.com/Malomalsky/Patterns/master/locallibrary/code.png)

**Note! Лучшей практикой является хранение секретных ключей в переменных окружения.**

### 2.1. Конфигурирование БД. 
В тестовом задании я использовал следующую модель БД: 

![DB Model](https://raw.githubusercontent.com/Malomalsky/Patterns/master/locallibrary/db.PNG)

Сниппет sql-кода для ее создания лежит [тут](https://github.com/Malomalsky/wav_transcripter/blob/master/create_table.sql)

Далее, необходимо сконфигурировать подключение к БД. Для этого в [dbwork](https://github.com/Malomalsky/wav_transcripter/blob/master/dbwork.py) вписываем соответсвующие параметры: 

![Конфиг](https://raw.githubusercontent.com/Malomalsky/Patterns/master/locallibrary/code1.png)

**Скрипт готов к работе!**

## Использование: 
Для вызова справки по скрипту необходимо вызвать следующую команду: 
```
python transcriptor.py --help
```

![](https://raw.githubusercontent.com/Malomalsky/Patterns/master/locallibrary/cli.PNG)

Единственный опциональный параметр - запись в бд (True по умолчанию; -d False чтобы отключить). 

**Использование скрипта выглядит следующим образом:** 
```
transcriptor.py [OPTIONS] PATH PHONE_NUMBER STEP
```

