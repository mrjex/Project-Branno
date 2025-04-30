# This script is responsible for the user's CLI inquiries with the database

# import sys
import db

# db.setVideoName(sys.argv[1])
# db.setCurrentDate()
# db.insertDocument()

userInput = "a"
while userInput != "q":
    print("")
    print("-- - -- INTERACTIVE STAGE -- - --")
    print("1. View entire database")
    print("2. Query by 'accuracy'")
    print("3. Query by 'ranking'")
    print("4. Query by 'strategical-detection'")
    print("5. Query by video name")
    print("6. Exit")
    print("-- - -- -- - -- -- - -- -- - -- --")
    print("")

    userInput = input("")

    # View entire database
    if userInput == "1":
        db.printAllDocuments()

    # Query by accuracy
    elif userInput == "2":
        print("")
        print("SELECT MINIMAL ALLOWED ACCURACY:")
        print("1. 50%")
        print("2. 75%")
        print("3. 90%")

        myDictionary = {"1":50, "2":75, "3":90}

        userInput = input("")
        
        db.queryByAccuracy(myDictionary[userInput]) # If user doesnt input a number between 1-3, then error occurs at this line --> Fix this later

    # Query by ranking
    elif userInput == "3":
        print("")
        print("SELECT MINIMAL ALLOWED RANKING:")
        print("1. 1")
        print("2. 3")
        print("3. 5")
        print("4. 10")

        myDictionary = {"1":1, "2":3, "3":5, "4":10}

        userInput = input("")

        db.queryByRanking(myDictionary[userInput])

    # Query by strategical detection
    elif userInput == "4":
        print("")
        print("SELECT STRATEGICAL DETECTION:")
        print("1. Machine-Learning")
        print("2. HSV")

        myDictionary = {"1": "Machine-Learning", "2":"HSV"}

        userInput = input("")

        db.queryByStrategicalDetection(myDictionary[userInput])

    # Query by video name
    elif userInput == "5":
        print("Not implemented yet!")

    # Exit interactive DB mode
    elif userInput == "6":
        break



db.client.close()



# OPTION 1
def printEntireDatabase():
    db.printAllDocuments()

# OPTION 2
def selectAccuracy():
    pass

# OPTION 3
def selectRanking():
    pass

# OPTION 4
def selectStrategicalDetection():
    pass

# OPTION 5
def selectVideo():
    pass




# IDEA --> Integrate Mohamad's accuracy algorithm in conjunction with the functional backend aspects of the accuracy


# INTERACTION KEYS/FLOWS

# 1. Select "Accuracy"



# 2. Select "Rank"




# 3. Select



# COMMANDS:

# "-h", "commands" --> Prints a list of all available commands in the user's terminal
# ...
