import math
import pandas as pd

# TODO --> Get the actual correct value of this (IMPORTANT)
carCenterPosition = [240, 50] # x, y
calculatedGroundSteeringValues = []
outputFile = "Visualization Services/Datasets/Pipeline Data/filtered-detected-cone-positions-current-exec.csv"


# The only entry point to this script from it's sibling 'csv-parser.py'. This function
# contains all the necessary operations to calculate the numerical values of the
# groundSteering, at the current frame of the .mp4 video
def analyzeCurrentFrame(myDictionary, i):
    distanceLeft = getConeDistance(myDictionary["left"])
    distanceRight = getConeDistance(myDictionary["right"])
    steeringAngle = calculateGroundSteering(distanceLeft, distanceRight)
    finalGroundSteering = mapAngleRange(steeringAngle)
    calculatedGroundSteeringValues.append(str(finalGroundSteering) + ";")


def getConeDistance(coneProperties):
    xDistance = getDistanceX(coneProperties)
    yDistance = getDistanceY(coneProperties)
    distance = getDistance(xDistance, yDistance)
    return distance

def getDistanceX(coneProperties):
    return abs(coneProperties[0] - carCenterPosition[0])

def getDistanceY(coneProperties):
    return abs(coneProperties[1] - carCenterPosition[1])

# Hyponetuousa --> Pythagaros theorem --> distance^2 = xD^2 + yD^2
def getDistance(xDistance, yDistance):
    return math.sqrt(math.pow(xDistance, 2) + math.pow(yDistance, 2))

def calculateGroundSteering(distanceLeft, distanceRight):

    # Turn to right if left cone is closer
    if distanceLeft < distanceRight:
        factor = distanceLeft / distanceRight
        return 90 * (1 + factor)
    
    # Turn to left if right cone is closer
    elif distanceRight < distanceLeft:
        factor = distanceRight / distanceLeft
        return 90 * factor
    else:
        return 90


# Maps from range 0-180 to -0.3 to 0.3
def mapAngleRange(G):
    # Linear Interpolation formula: the G values that ranges from 0 to 180 and the groundSteering value (-0.3 to 0.3)
    val = (G - 0) / (180 - 0)
    return -0.3 + (0.3 - -0.3) * val



# Store the calculated ground steering angles in a CSV in "/Visualization Service"
def storeCalculatedResults():
    # filename = "Visualization Services/Datasets/Pipeline Data/groundSteering-test3.csv"
    df = pd.read_csv(outputFile)
    # print(calculatedGroundSteeringValues[0])



    # TODO: If the number of rows of ['groundSteering-calculated'] is inequal to the number
    # of rows in 'filtered-detected-cone-positions-current-exec.csv', then get the difference
    # of rows: X = 'filtered-detected-cone-positions-current-exec.csv' - ['groundSteering-calculated']
    #
    # add X instances of '0's

    results = pd.read_csv(f"{outputFile}") 
  

    #print("-------------------------------------------------------------------------------")
    #print(f"Number of values to add: {len(calculatedGroundSteeringValues)}")
    #print(f"Number of actual values: {len(results)}")
    #print("-------------------------------------------------------------------------------")

    # We don't need to work with the absolute value here, since it's an impossibility that the
    # calculated-values are less than the expected, as they're derived from the .csv file
    diff = len(results) - len(calculatedGroundSteeringValues)
    for num in range(0, diff):
        calculatedGroundSteeringValues.append(0)


    df['groundSteering-calculated'] = calculatedGroundSteeringValues
    # df.to_csv(filename, index=False) # Previous --> Works but adds additional ","
    df.to_csv(outputFile, index=False, sep=' ')