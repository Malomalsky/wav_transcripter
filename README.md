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

Единственный опциональный параметр - запись в бд *(True по умолчанию; -d False чтобы отключить).* 

**Использование скрипта выглядит следующим образом:** 
```
transcriptor.py [OPTIONS] PATH PHONE_NUMBER STEP
```
* PATH - путь до wav-файла. 
* PHONE_NUMBER - телефонный номер. 
* STEP - этап. Принимает два значения: 1 - распознования автоответчика; 2 - распознование положительной/отрицательной реакции. 

Примеры: 
![](https://raw.githubusercontent.com/Malomalsky/Patterns/master/locallibrary/%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%801.PNG)
![](https://raw.githubusercontent.com/Malomalsky/Patterns/master/locallibrary/%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%802.PNG)

## Логи. 
У стандартной библиотеки Python для логирования *logging* есть ряд проблем - логи разных уровней (ERROR, INFO, WARNING, etc.) записываются **в один файл**, нет возможности выбрать кодировку записи. Поэтому в дополнение к ней был решено использовать библиотеку [loguru](https://github.com/Delgan/loguru). С помощью нее ведется лог ошибок скрипта. 
Лог с информацией (script.log) выглядит следующим образом: 
```
28-Aug-20 15:25:19 - 89851c52-e929-11ea-8992-d43d7e49fa06 - АО - 88005553535 - 5.700s - вас приветствует автоответчик оставьте сообщение после сигнала
```
В логе ошибок (error.log) предоставляется детальная информация об ошибке (от интерпритатора Python). 

