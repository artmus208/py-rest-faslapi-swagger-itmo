FROM python:3.12

WORKDIR /app

RUN apt-get update 

RUN apt-get install sqlite3

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt



RUN alembic init alembic
COPY alembic.ini ./

COPY alembic /app/alembic

# Копирование всего приложения в контейнер
# Папка app будет скопирована в контейнер в директорию /app/app
COPY ./app /app/app  

COPY start.sh /app

# Установка прав на выполнение скрипта
RUN chmod +x /app/start.sh

EXPOSE 5000:5000

CMD ["/app/start.sh"]
