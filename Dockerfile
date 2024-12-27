FROM python:3.12

WORKDIR /app

RUN apt-get update 

RUN apt-get install sqlite3

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY ./app .

EXPOSE 5000:5000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "5000"]
