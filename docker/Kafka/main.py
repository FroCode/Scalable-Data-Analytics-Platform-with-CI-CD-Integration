import time
import random
import paho.mqtt.client as mqtt

# MQTT Broker Configuration
MQTT_BROKER = "test.mosquitto.org"  # Public broker (use a private one for production)
MQTT_PORT = 1883
MQTT_TOPIC = "iot/sensor/data"

# Simulate IoT Device Data
def generate_sensor_data():
    return {
        "temperature": round(random.uniform(20.0, 30.0), 2),
        "humidity": round(random.uniform(30.0, 70.0), 2),
        "light": random.randint(100, 1000)
    }

# Connect to MQTT Broker
client = mqtt.Client()
client.connect(MQTT_BROKER, MQTT_PORT, 60)

# Publish Data
while True:
    data = generate_sensor_data()
    print(f"Publishing data: {data}")
    client.publish(MQTT_TOPIC, str(data))
    time.sleep(2)  # Publish every 2 seconds
