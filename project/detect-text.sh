# Install tesseract via pre-built binary packages
sudo apt install tesseract-ocr
sudo apt install libtesseract-dev
pip install pytesseract

# Store the detected text inside a variable
detectedText=$(tesseract "assets/Automation-Document.png" - -l eng)

echo $detectedText

# TODO --> Research how to run a "contains" query on a String variable in .sh script

# IDEA --> this .sh script reads the template of execution of "contains" queries in conjunction with
# what another .yaml file specifies