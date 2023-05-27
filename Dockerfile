FROM python:3.6-slim

RUN apt-get update && apt-get install -y build-essential

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash"]
