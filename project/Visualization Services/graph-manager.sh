#####     GRAPH MANAGER     #####
#   - Text
#
#   - Scalability, maintainability


VIDEO_NAME=${1}
CSV_DATASET_NAME="filtered-detected-cone-positions-current-exec.csv"

cd "$(dirname "$0")"
./plot-groundSteering.sh "${CSV_DATASET_NAME}" groundSteering-correct groundSteering-calculated bf000a fdd503 1584543153 1584543233 -0.3 0.3 "${VIDEO_NAME}"