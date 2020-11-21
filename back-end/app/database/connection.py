from pymongo import MongoClient

client = MongoClient()
database = client["moove_database"]

users_collection = database["users"]
communities_collection = database["communities"]
membership_collection = database["membership"]
challenges_collection = database["challenges"]
achievements_collection = database["achievements"]
