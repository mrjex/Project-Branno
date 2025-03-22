# Code for the automation of the creation of all .png visualizations here
# (Basically convert the contained .csv files in /Datasets into .png in /Graphs)


analyzedVideoName=${1}
detectionModule=${2}
algorithmicModule=${3}


getLastElementOfSlashSplittedString() {
    OUTPUT=$( echo ${analyzedVideoName##*/} )
    echo "${OUTPUT}"
}


getFirstElementOfDotSplittedString() {
    OUTPUT=$( printf "%s\n" "${SELECTED_FILE%%.*}" )
    echo "${OUTPUT}"
}


getGraphOutputName() {
    # Get the full name of the file (inlcuding the '.mp4' file extension) of the video
    SELECTED_FILE=$(getLastElementOfSlashSplittedString "${analyzedVideoName}")

    # Only get the name of the file, excluding the '.mp4' file extension
    FILE_NAME=$(getFirstElementOfDotSplittedString "${SELECTED_FILE}")

    echo "${FILE_NAME}"
}

python3 "Visualization Services/Database/interactive-stage.py" "${analyzedVideoName}" "${detectionModule}" "${algorithmicModule}"

FILE_NAME=$(getGraphOutputName)

./"Visualization Services/graph-manager.sh" "${FILE_NAME}"