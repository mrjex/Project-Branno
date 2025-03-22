import sys
datasetVersion = sys.argv[1]

from roboflow import Roboflow
rf = Roboflow(api_key="6DSFMEpJKr6yzVUugSJP")
project = rf.workspace("group14yolo").project("myproject-asfs2")
version = project.version(datasetVersion)
dataset = version.download("yolov8")
