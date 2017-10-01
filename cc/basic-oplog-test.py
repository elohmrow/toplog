# http://api.mongodb.com/python/current/examples/tailable.html

import time
from pymongo import MongoClient
import pymongo

client = MongoClient()
oplog = client.local.oplog.rs
first = oplog.find().sort('$natural', pymongo.ASCENDING).limit(-1).next()
print(first)
ts = first['ts']

while True:
    cursor = oplog.find({'ts': {'$gt': ts}},
                        cursor_type=pymongo.CursorType.TAILABLE_AWAIT,
                        oplog_replay=True)
    while cursor.alive:
        for doc in cursor:
            ts = doc['ts']
            print(doc)
        time.sleep(1)
