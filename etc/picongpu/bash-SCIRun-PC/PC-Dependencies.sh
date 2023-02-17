#Run using source PC-Dependencies.sh (do not use sudo)

#    The following files should be present in the $HOME directory when installing the Project
#    PC-Dependencies.sh
#    PC-CUDA_Toolkit.sh
#    PC-PIConGPU.sh
#    PC-Qt.sh
#    PC-SCIRun.sh
#    picongpu.profile
#    picongpu_reRun.profile

# Dependencies
    sudo apt update
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

