from kafka import KafkaProducer

# Create a Kafka producer
producer = KafkaProducer(bootstrap_servers='kafka:9093')

# Send a string message to the Kafka topic
while True:
    message = input("Enter message to send: ")
    producer.send('my_topic', value=message.encode('utf-8'))
    print(f"Sent: {message}")
