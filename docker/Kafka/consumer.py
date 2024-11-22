from kafka import KafkaConsumer

# Kafka Configuration
KAFKA_BROKER = "localhost:9092"  # Your Kafka broker address
KAFKA_TOPIC = "iot-data"         # Kafka topic to consume messages from

# Kafka Consumer
consumer = KafkaConsumer(
    KAFKA_TOPIC,
    bootstrap_servers=KAFKA_BROKER,
    auto_offset_reset='earliest',  # Start from the earliest available messages
    group_id="iot-group",          # Consumer group ID (you can use any unique group name)
    value_deserializer=lambda x: x.decode('utf-8')  # Deserialize the message
)

print(f"Consuming messages from Kafka topic: {KAFKA_TOPIC}")
for message in consumer:
    print(f"Received: {message.value}")
