from pymongo import MongoClient

# get the db connection:
client = MongoClient()
db = client.test

# just to prove it is now really a capped collection:
print db.command('collstats','restaurants')['capped']
