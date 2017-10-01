from pymongo import MongoClient

# get the db connection:
client = MongoClient()
db = client.test

# convert the existing db into a capped collection:
# (it has 25,359 documents with total size 11874761 bytes)
db.command({'convertToCapped': 'restaurants', 'size': 2500000})
# ^ make a capped collection no bigger than 2.5MB (about 5000 slots - can't use 'max' with 'convertToCapped')
