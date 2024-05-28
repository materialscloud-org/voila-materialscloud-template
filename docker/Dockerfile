FROM python:3.9

WORKDIR /home/voila

COPY pyproject.toml LICENSE.txt README.md ./
RUN pip install .[dev]

EXPOSE 8866