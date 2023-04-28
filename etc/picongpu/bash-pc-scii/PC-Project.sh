
#This script is in development and has not been tested as of 28 April 2023 -KP

#The recommendation is that the Nvidia driver and CUDA Toolkit be installed prior to running this script 
#Install the software Stack on a PC - run using source PC-Project.sh (do not use sudo)

#Run the SCIRun program with
#    ~/SCIRun/bin/SCIRun/SCIRun

#These files need to be present to run this script

#    PC-Dependencies.sh
#    PC-PIConGPU.sh
#    PC-Qt.sh                        Qt.sh is needed if the project is to be run using SCIRun
#    PC-SCIRun.sh                    SCIRun.sh is needed if the project is to be run using SCIRun

    # Install dependencies
    source PC-Dependencies.sh

    # Install PIConGPU
    source PC-PIConGPU.sh

    # Install Qt                  Run PC-Qt.sh if the project is to be run using SCIRun
    source PC-Qt.sh

    # Install SCIRun              Run PC-SCIRun.sh if the project is to be run using SCIRun
    source PC-SCIRun.sh

    export PATH=~/SCIRun/bin/SCIRun:$PATH  #might not be needed

