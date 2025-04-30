import csv
import sys
from ultralytics import YOLO

videoToPlay = sys.argv[1]
model = YOLO('runs/detect/train/weights/best.pt')

videoPath = "../../../" + videoToPlay
results = model(videoPath) # Short video

fields = ['X-Position', 'Y-Position', 'Width', 'Height']
newFrameField = ['----- NEW FRAME -----']

filename = "../../../Algorithmic Services/Input/detected-cone-positions.csv"

with open(filename, 'w') as csvfile:
    csvwriter = csv.writer(csvfile)
    csvwriter.writerow(fields)

    for r in results:
        # print(r.boxes)  # print the Boxes object containing the detection bounding boxes
        csvwriter.writerow(newFrameField)
        csvwriter.writerows(r.boxes.xywh)
