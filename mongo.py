from pymongo import MongoClient
from os import environ

# TODO: hay que ver cómo apañamos la conexión para que podamos usar variables de entorno
#client = MongoClient('mongodb://localhost:27017')
#=======
client = MongoClient(f'mongodb://{environ.get("MONGO_IP", "127.0.0.1")}:{environ.get("MONGO_PORT", "27017")}')
#>>>>>>> origin/main.dao.os_environ
db = client['quacker']
users = db['users']
quacks = db['quacks']
