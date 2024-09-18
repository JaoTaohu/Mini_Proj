# app/Dockerfile

FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y 

COPY ./requirements.txt /app/requirements.txt

RUN pip3 install -r requirements.txt

COPY ./app.py /app/app.py

EXPOSE 8501

ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]