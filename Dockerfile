FROM python:3.11-slim

RUN useradd -m appuser

WORKDIR /app

RUN apt-get update && apt-get install -y gcc default-libmysqlclient-dev pkg-config && rm -rf /var/lib/apt/lists/* 

COPY requirement.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chown -R appuser:appuser /app

USER appuser

EXPOSE 5000

ENTRYPOINT ["python"]

CMD ["app.py"]