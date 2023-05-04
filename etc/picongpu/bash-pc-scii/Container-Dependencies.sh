#    The following files show individual parts of the .def file
#    Container-Dependencies.sh
#    Container-PIConGPU.sh
#    Container-Qt.sh
#    Container-SCIRun.sh

# Dependencies
    apt update
    apt -y install build-essential
    apt -y install wget
    apt -y install curl
    apt -y install python3
    apt -y install cmake file cmake-curses-gui
    apt -y install libgl1-mesa-dev
	apt -y install libglfw3-dev libglu1-mesa-dev
    apt -y install libffi-dev
    apt -y install git
    apt -y install rsync
    apt -y install qt5-qmake
    apt -y install qtwayland5
    apt -y install xapp          #does away with an error report when SCIRun starts

