#####     SYSTEM EXEC     ######
#   - Automated executions accross the entire system


# Run all .mp4 videos in "/Tests" folder
runAllVideos() {
    DETECTION_MODULE="ML"                   # Possible values: {ML, HSV}
    ALGORITHMIC_MODULE="Trigonometry"       # Possible values: {Trigonometry, Linear Regression}

    for i in $(seq 5 $END)
    do
        CURRENT_VIDEO="Tests/Recordings/Normal/video-${i}.mp4"

        ../../pipeline.sh ${CURRENT_VIDEO} ${DETECTION_MODULE} ${ALGORITHMIC_MODULE}

        # ./pipeline.sh ${CURRENT_VIDEO} ${DETECTION_MODULE} ${ALGORITHMIC_MODULE}
    done
}


# Run all combinations (all .mp4 files with all options such as ML, HSV, Trigonometry and Linear Regression)
runAllCombinations() {
    echo "TODO"
}


runAllVideos