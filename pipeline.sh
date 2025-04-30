# pipeline.sh

# This script starts the entire system's pipe-and-filter architecture, by running
# the 3 services or filters in sequential order



##  CONFIGURATIONS  ##


videoToPlay=Tests/Recordings/Normal/video-3.mp4 # The name of the .mp4 file in the "/Tests" directory
detectionModule="ML" # The name of the "Detection Service" module to use. Possible Values: ("ML", "HSV")
algorithmicModule="Trigonometry"

fileOutputCSV="filtered-detected-cone-positions-current-exec.csv"




## FUNCTIONS  ##


# Function:
#   - Modifies the path of a .mp4 file to its corresponding .csv file
#
# Example :
#   - BEFORE: tests/Recordings/normal/video2.mp4
#   - AFTER: tests/expected-data/normal/video2.csv
#
getPathCSV() {
    REPLACEMENT_1="csv"
    REPLACEMENT_2="expected-data"

    CSV_FILE_PATH=$(echo "${videoToPlay/mp4/"$REPLACEMENT_1"}")
    CSV_FILE_PATH=$(echo "${CSV_FILE_PATH/Recordings/"$REPLACEMENT_2"}")

    echo "${CSV_FILE_PATH}"
}


# Function:
#   - Outputs its content in a .csv file to the next and last filter's directory "/Visualization Services"
#
transferContentCSV() {
    CSV_CONTENT=$(cat "${CSV_FILE_PATH}")
    # echo "${CSV_CONTENT}" > "Visualization Services/Datasets/Pipeline Data/groundSteering-test3.csv"
    echo "${CSV_CONTENT}" > "Visualization Services/Datasets/Pipeline Data/${fileOutputCSV}"
}


# Control the number of arguments that are passed, to allow for the option to either pass arguments or
# set default values in this inherent .sh script. Essentially, this method accounts for the calls of
# this script from system-exec.sh and enables us to automate all the .mp4 videos in "/Tests" directory.
managePassedArguments() {

    # If developer passed arguments manually or via "/dev-endpoints/exec/system-exec.sh"
    # when executing this script
    if [ "$#" -gt 0 ]
    then
        # If num of passed args >= 1, assign the video to play
        if [ "$#" -ge 1 ]
        then
            videoToPlay=${1}

            # If num of passed args >= 2, assign the detection module
            if [ "$#" -ge 2 ]
            then
                detectionModule=${2}

                # If num of passed args >= 3, assign the algoritmic module
                if [ "$#" -ge 3 ]
                then
                    algorithmicModule=${3}

                    # If num of passed args != 3, notice developer of reduntant arguments passed
                    if [ "$#" -ne 3 ]
                    then
                        echo "WARNING: Only 3 arguments are needed in 'pipeline.sh' (videoToPlay, detectionModule, algorithmicModule)"
                    fi
                fi
            fi
        fi
    fi
}




##  MAIN LOGIC  ##

cd "$(dirname "$0")"
managePassedArguments "$@"

##  FILTER 1  ##
./detection-filter.sh ${videoToPlay} ${detectionModule}

##  FILTER 2  ##
CSV_FILE_PATH=$(getPathCSV)
transferContentCSV "${CSV_FILE_PATH}"

./algorithmic-filter.sh ${detectionModule} ${algorithmicModule}

##  FILTER 3 ##
./visualization-filter.sh ${videoToPlay} ${detectionModule} ${algorithmicModule}