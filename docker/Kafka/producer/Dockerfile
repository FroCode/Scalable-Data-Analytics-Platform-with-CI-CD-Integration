FROM python:3.9-slim

WORKDIR /app

# Copy the producer script
COPY producer.py /app/producer.py

# Install dependencies
RUN pip install kafka-python

CMD ["python", "producer.py"]
