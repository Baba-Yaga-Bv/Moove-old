from pymongo import MongoClient

client = MongoClient()
database = client["moove_database"]

users_collection = database["users"]
communities_collection = database["communities"]