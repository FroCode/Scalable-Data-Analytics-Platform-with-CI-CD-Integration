from kafka import KafkaAdminClient
from kafka.admin import NewTopic
import os

KAFKA_BROKER = os.getenv('KAFKA_BROKER', 'kafka:9093')
KAFKA_TOPIC = os.getenv('KAFKA_TOPIC', 'my_topic')

# Create an admin client
admin_client = KafkaAdminClient(bootstrap_servers=KAFKA_BROKER)

# Create the topic if it doesn't exist
topic = NewTopic(name=KAFKA_TOPIC, num_partitions=1, replication_factor=1)
admin_client.create_topics(new_topics=[topic], validate_only=False)

print(f"Topic '{KAFKA_TOPIC}' created.")
