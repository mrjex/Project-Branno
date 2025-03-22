# Install Git LFS
git lfs install

# Track the large files
git lfs track "*.mp4"
git lfs track "*.avi"

# Add the .gitattributes file
git add .gitattributes

# Add and commit your files again
git add .
git commit -m "Added large files using Git LFS"
git push