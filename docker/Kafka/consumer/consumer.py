from kafka import KafkaConsumer

# Create a Kafka consumer
consumer = KafkaConsumer(
    'my_topic',
    bootstrap_servers='kafka:9093',
    auto_offset_reset='earliest',  # Start reading from the beginning
    group_id=None  # No consumer group
)

# Consume messages and print them
for message in consumer:
    print(f"Received: {message.value.decode('utf-8')}")
