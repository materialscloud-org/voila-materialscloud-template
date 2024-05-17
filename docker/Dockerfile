FROM python:3.9

WORKDIR /home/voila

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY requirements_dev.txt .
RUN pip install -r requirements_dev.txt

EXPOSE 8866