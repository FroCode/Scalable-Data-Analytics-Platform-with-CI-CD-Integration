FROM python:3.9-slim

WORKDIR /app

# Copy the consumer script
COPY consumer.py /app/consumer.py

# Install dependencies
RUN pip install kafka-python

CMD ["python", "consumer.py"]
