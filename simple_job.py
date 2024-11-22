from pyspark import SparkContext

sc = SparkContext(appName="SimpleJob")
data = sc.parallelize(range(1000))
count = data.filter(lambda x: x % 2 == 0).count()
print(f"Count of even numbers: {count}")

sc.stop()
