[ghost@pvnp test]$ mongoimport --db test --collection restaurants --drop --file ~/kdw/test/primer-dataset.json
2017-10-01T09:44:47.853+0000    connected to: localhost
2017-10-01T09:44:47.853+0000    dropping: test.restaurants
2017-10-01T09:44:49.354+0000    imported 25359 documents
[ghost@pvnp test]$

[ghost@pvnp ~]$ mongo --quiet --eval  "printjson(db.adminCommand('listDatabases'))"
{
    "databases" : [
        {
            "name" : "admin",
            "sizeOnDisk" : 49152,
            "empty" : false
        },
        {
            "name" : "local",
            "sizeOnDisk" : 32768,
            "empty" : false
        },
        {
            "name" : "test",
            "sizeOnDisk" : 4911104,
            "empty" : false
        }
    ],
    "totalSize" : 4993024,
    "ok" : 1
}
[ghost@pvnp ~]$


## OPLOG ## ##############################################################
# for running oplog with/out cluster:
# [1] add to /etc/mongod.conf
replication:
   replSetName: rs

# [2] need /etc/hosts where master is running to point to itself.
# note that this alone is not good enough:
127.0.0.1   localhost
# need also this:
127.0.0.1 pvnp.us
# ^ this was very painful.  could not query oplog at all until adding that
# [3] 
rs:PRIMARY> use local
switched to db local
rs:PRIMARY> db.oplog.rs.find()
## OPLOG ## ##############################################################
