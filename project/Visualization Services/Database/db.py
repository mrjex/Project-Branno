# This script contains all the functional CRUD operations, as well as the connection to the database

from pymongo import MongoClient
from bson.objectid import ObjectId

import datetime
import pprint

import sys


uri = "mongodb+srv://admin:123@javascriptexercises-clu.dk25y82.mongodb.net/?retryWrites=true&w=majority&appName=JavaScriptExercises-Cluster"
client = MongoClient(uri)
db = client['CyberPhysicalSystem-Group14']
collection = db['Visualizations']


# TODO --> Change attribute to "accuracy-percentage" (int here)
# Inject new documents of new format
# Try the queryAccuracy method again


def getCurrentTime():
    return datetime.datetime.now(tz=datetime.timezone.utc)


# testArg=sys.argv[2]


objectExample = {
        "accuracy-avg-percentage": 59.7,
        "rank": 7,
        "strategical-detection": f"{sys.argv[2]}",
        "algorithm": f"{sys.argv[3]}",
        "video-name": f"{sys.argv[1]}",
        "date": f"{getCurrentTime()}"
    }




# IDEA: Since this function now is reduntant, use the update-syntax to update the ranks
def setVideoName(name):
    objectExample.update({"video-name": f"{name}"}) # Update a value


def printAllDocuments():
    print("\n")
    print("ALL DB INSTANCES:\n")
    cursor = collection.find({})
    for doc in cursor:
        print(doc)
    print("\n")


def insertDocument():
    insertedDoc = collection.insert_one(objectExample)
    print(f"Inserted document id: {insertedDoc.inserted_id}")


def findOneDocById(collection):
    user = collection.find_one({"_id": ObjectId("662bd314078eb1dcedcf05cc")})
    if user:
        return user["name"]


def findOneDocByField():
    user = collection.find_one({"accuracy": "98%"})
    if user:
        return user["accuracy"]
    

# Delete all documents that matches the query
def deleteDocumentByQuery():
    collection.delete_many({"strategical-detection": "Machine-Learning"})


# If the developer wants to update the date after the object has been inserted into the database
def setCurrentDate():
    now = getCurrentTime()
    objectExample.update({"date": f"{now}"})





def dateRangeQuery():
    d = datetime.datetime(2009, 11, 12, 12) # 2009-11-12 12:00:00
    # d2 = getCurrentTime()
    # "$gt" is greaterThan and $lt" is lessThan
    for doc in collection.find({"date": {"$gt": d}}).sort("date"):
        pprint.pprint(doc)


def queryByAccuracy(minAccuracy):
    print(f"Min accuracy: {minAccuracy}")
    for doc in collection.find({"accuracy-avg-percentage": {"$gt": minAccuracy}}).sort("accuracy-avg-percentage"):
        pprint.pprint(doc)


def queryByRanking(minRanking):
    print(f"Min ranking: {minRanking}")
    for doc in collection.find({"rank": {"$lte": minRanking}}).sort("rank"):
        pprint.pprint(doc)


def queryByStrategicalDetection(strategicalDetection): # NOTE --> ERROR, Doesn't work at the moment
    print(f"Strategical Detection: {strategicalDetection}")

    docs = collection.find({"strategical-dection": f"{strategicalDetection}"})

    for doc in docs:
        print(doc)


# Query database for one document that matches the attribute
# foundDoc3 = collection.find_one({"accuracy": "98%"})


# Query for data based on whether or not a document was generated before or after the selected data
# d = datetime.datetime(2009, 11, 12, 12) # 2009-11-12 12:00:00

# client.close() # INTERRUPT MONGODB CONNECTION

# interaction-stage=enabled


# setCurrentDate()
insertDocument()