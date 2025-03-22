#####     DETECTION FILTER     #####
#
#   - Description here



# EXAMPLE EXECUTIONS:
#   RUN THIS SCRIPT SEPARATELY:
#       - "./detection-filter.sh tests/recordings/normal/CID-140-recording-2020-03-18_145233-selection.mp4"
#       - "./detection-filter.sh tests/recordings/normal/CID-140-recording-2020-03-18_144821-selection.mp4"
#
#   RUN THIS SCRIPT IN PIPELINE
#   - "./pipeline.sh" (modify the selected video argument inside of the script)





TRAIN_ML_MODEL="False"
machineLearningModulePath="Detection Services/Machine Learning Module/MyProject-3"
# hsvModulePath="Detection Services/Miniature Car Module"

selectedVideo=$1
DETECTION_MODULE=$2 # SPECIFIED OPTION IN DOCUMENT (COMPULSORY): Detection-Module (ML or HSV)




# SPECIFIED OPTION IN DOCUMENT (OPTIONAL): Train ML on new dataset (If skipping this step, we will run Yolov8 on a previously trained dataset)
# PROBLEM --> data.yaml requires a specific path, which needs to be generalized. ALthough this is not necessary, we could just train it by ourselves manually
trainMachineLearningModel() {
    yolo task=detect mode=train model=yolov8s.pt data=data.yaml epochs=50 imgsz=640
}

predictMachineLearningModel() {
    yolo task=detect mode=predict model=runs/detect/train/weights/best.pt show=True conf=0.25 source="../../../${selectedVideo}"
}


# Run the Hue-Saturation-Value detection module
runModuleHSV() {
    echo "HSV MODE!"
}


# Run the Machine-Learning detection module
runModuleML() {

    # If developer wants to train the model on new data, then inspect the files in "/train" directory to rebuild the model
    if [ "${TRAIN_ML_MODEL}" == "True" ]
    then
        trainMachineLearningModel
    fi

    cd "Detection Services/Machine Learning Module/MyProject-3"

    python3 generate-video-csv.py "${selectedVideo}"
    predictMachineLearningModel

    # cd ../../../
}




if [ "${DETECTION_MODULE}" == "HSV" ]
then
    runModuleHSV
else
    runModuleML
fi