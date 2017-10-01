from pymongo import MongoClient

client = MongoClient()
db = client.test

cursor = db.restaurants.find().limit(5)

for document in cursor:
    print(document)
