from kafka import KafkaProducer
import os

# Kafka broker and topic from environment variables
KAFKA_BROKER = os.getenv('KAFKA_BROKER', 'kafka:9093')
KAFKA_TOPIC = os.getenv('KAFKA_TOPIC', 'my_topic')

# Create producer
producer = KafkaProducer(bootstrap_servers=KAFKA_BROKER)

# Send a message to the Kafka topic
producer.send(KAFKA_TOPIC, b'Hello, Kafka!')
producer.flush()

print(f"Message sent to {KAFKA_TOPIC}")
