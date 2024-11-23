from kafka import KafkaConsumer
import os

# Kafka broker and topic from environment variables
KAFKA_BROKER = os.getenv('KAFKA_BROKER', 'kafka:9093')
KAFKA_TOPIC = os.getenv('KAFKA_TOPIC', 'my_topic')

# Create consumer
consumer = KafkaConsumer(KAFKA_TOPIC, bootstrap_servers=KAFKA_BROKER)

# Read messages from the topic
for message in consumer:
    print(f"Received message: {message.value.decode()}")
