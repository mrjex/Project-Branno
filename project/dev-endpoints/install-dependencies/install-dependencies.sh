

installGnuPlot() {
    sudo apt install gnuplot-nox
    sudo apt install gnuplot-qt
    sudo apt install gnuplot-x11
    sudo apt install plotutils
}

installPythonDependencies() {
    # pip install -r requirements.txt   # Python 2
    pip3 install -r requirements.txt    # Python 3
}