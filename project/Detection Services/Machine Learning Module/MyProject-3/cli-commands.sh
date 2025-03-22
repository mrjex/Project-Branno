# Train data
yolo task=detect mode=train model=yolov8s.pt data=data.yaml epochs=50 imgsz=640


# Validation failed
# yolo task=detect mode=val model=runs/detect/train/weights/best.pt data=data.yaml # PRODUCES THE FOLLOWING ERROR --> "libEGL warning: DRI2: failed to authenticate"



# WORKS --> OUtputs in another repo, but accurate detection
yolo task=detect mode=predict model=runs/detect/train/weights/best.pt conf=0.25 source=test/images


# Run video with prediction detection boxes:

# Short video (372 vs 366 csv lines/frames)
yolo task=detect mode=predict model=runs/detect/train/weights/best.pt show=True conf=0.25 source=CID-140-recording-2020-03-18_144821-selection.mp4

# Long video (799 vs 798 csv lines/frames)
yolo task=detect mode=predict model=runs/detect/train/weights/best.pt show=True conf=0.25 source=CID-140-recording-2020-03-18_145233-selection.mp4