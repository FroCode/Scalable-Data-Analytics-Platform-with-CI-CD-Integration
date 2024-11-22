import paho.mqtt.client as mqtt
from confluent_kafka import Producer

# MQTT Settings (use localhost if running locally or the correct broker IP)
MQTT_BROKER = "localhost"  # Change to "mqtt.eclipse.org" or the broker's IP if needed
MQTT_PORT = 1883
MQTT_TOPIC = "iot/sensor/data"

# Kafka Settings
KAFKA_BROKER = "localhost:9092"  # Change to your Kafka broker address if needed
KAFKA_TOPIC = "iot-data"

# Create Kafka producer
producer = Producer({'bootstrap.servers': KAFKA_BROKER})

# Callback when message is received
def on_message(client, userdata, msg):
    message = msg.payload.decode()
    print(f"Received message: {message}")
    producer.produce(KAFKA_TOPIC, message.encode('utf-8'))  # Send message to Kafka
    producer.flush()  # Ensure the message is sent to Kafka
    print(f"Published message to Kafka topic '{KAFKA_TOPIC}'")

# Create MQTT Client
client = mqtt.Client()

# Set up the message callback
client.on_message = on_message

# Connect to the MQTT broker
client.connect(MQTT_BROKER, MQTT_PORT, 60)

# Subscribe to the topic
client.subscribe(MQTT_TOPIC)
print(f"Subscribed to MQTT topic: {MQTT_TOPIC}")

# Loop forever to process incoming messages
client.loop_forever()
