
#Install the software Stack on a PC - run using source PC-Project.sh (do not use sudo)
#Run PIConGPU (stand alone) with
#    source Sim_run or with source Sim_reRun if the simulation has been previously run and does not need to be compiled
#Run the SCIRun program with
#    ~/SCIRun/bin/SCIRun/SCIRun

#These files need to be present to run this script and then run PIConGPU as a stand alone application or run SCIRun with PIConGPU

#    PC-Dependencies.sh
#    PC-CUDA_Toolkit.sh
#    PC-PIConGPU.sh
#    PC-Qt.sh
#    PC-SCIRun.sh                    SCIRun.sh is needed if the project is to be run using SCIRun
#    picongpu.profile
#    picongpu_reRun.profile

    # Install dependencies
    source PC-Dependencies.sh

    # Install CUDA Toolkit        #Installs v 11.7.1
    source PC-CUDA_Toolkit.sh
    export PATH=/usr/local/cuda-11.7/bin${PATH:+:${PATH}}

    # Install PIConGPU
    source PC-PIConGPU.sh

    # Install Qt                  Run PC-Qt.sh if the project is to be run using SCIRun
    source PC-Qt.sh

    # Install SCIRun              Run PC-SCIRun.sh if the project is to be run using SCIRun
    source PC-SCIRun.sh

    export PATH=~/SCIRun/bin/SCIRun:$PATH  #might not be needed

    echo The PATH for CUDA 11.7 has been temporarily set.  Set it permanently using the steps shown at the bottom of PC-Project.sh

#Set the Cuda Toolkit path using the following steps
#    sudo su
#    echo "export PATH=/usr/local/cuda-11.7/bin${PATH:+:${PATH}}" >> /etc/profile
#    reboot

