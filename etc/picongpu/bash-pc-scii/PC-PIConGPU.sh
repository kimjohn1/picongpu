# Remove any previously installed directories         #From the original dev2-picongpu.dependencies
    rm -rf ~/src/openPMD-api ~/src/openPMD-api-build ~/src/picongpu ~/src/pngwriter ~/src/pngwriter-build ~/src/ADIOS2 ~/src/ADIOS2-build
    rm -rf ~/lib/openPMD-api ~/lib/pngwriter ~/lib/ADIOS2
    rm -rf scratch
    rm -rf picInputs
     
# Create directories
    mkdir -p ~/src/openPMD-api ~/src/openPMD-api-build
    mkdir -p ~/src/pngwriter ~/src/pngwriter-build
    mkdir -p ~/src/ADIOS2 ~/src/ADIOS2-build
    mkdir -p ~/lib/openPMD-api
    mkdir -p ~/lib/pngwriter
    mkdir -p ~/lib/ADIOS2
    export SCRATCH=~/scratch
    mkdir -p ~/picInputs
    mkdir -p $SCRATCH/runs

# Set system variables
    export PICSRC=~/src/picongpu
    export PIC_EXAMPLES=$PICSRC/share/picongpu/examples
    #export PIC_BACKEND="omp2b:native"
    #export PIC_BACKEND="cuda:61"
    export PIC_BACKEND="cuda:86"
    export PIC_CLONE=~/picInputs
    export PIC_CFG=etc/picongpu
    export PIC_OUTPUT=$SCRATCH/runs

    export PATH=$PATH:$PICSRC:$PICSRC/bin:$PICSRC/src/tools/bin
    export PYTHONPATH=$PICSRC/lib/python:$PYTHONPATH

# Load gcc - accomplished in Dependencies
#    apt -y install build-essential

# Load CMake - accomplished in Dependencies
#    apt -y install cmake file cmake-curses-gui

# Load openmpi
    sudo apt install -y libopenmpi-dev

# Load zlib
    sudo apt install zlib1g-dev

# Load boost Installs version 1.74.0
    sudo apt -y install libboost-program-options-dev libboost-filesystem-dev libboost-system-dev libboost-math-dev libboost-serialization-dev

# Load git - accomplished in Dependencies
#    sudo apt install -y git

# Load rsync - accomplished in Dependencies
#    sudo apt install -y rsync

# Retrieve PIConGPU source code and change to the -dev branch
    cd ~/src
    git clone https://github.com/kimjohn1/picongpu.git
    cd picongpu
    git checkout Vis
    cd ~/

# Load libpng
    cd ~/
    sudo apt install -y libpng-dev

# Load pngwriter
    cd ~/src
    git clone https://github.com/pngwriter/pngwriter.git
    cd pngwriter-build
    cmake -DCMAKE_INSTALL_PREFIX=~/lib/pngwriter ~/src/pngwriter
    make install -j8
    cd ~/

    export CMAKE_PREFIX_PATH=~/lib/pngwriter:$CMAKE_PREFIX_PATH
    export LD_LIBRARY_PATH=~/lib/pngwriter/lib:$LD_LIBRARY_PATH

# Load hdf5 - apt installs version 1.10.4
    cd ~/
    sudo apt install -y libhdf5-openmpi-dev

# Load ADIOS2 - installs latest version
    cd ~/src
    git clone https://github.com/ornladios/ADIOS2.git ADIOS2
    cd ADIOS2-build
    cmake -DCMAKE_INSTALL_PREFIX=~/lib/ADIOS2 -DADIOS2_USE_Fortran=OFF -DADIOS2_USE_PNG=OFF -DADIOS2_USE_BZip2=OFF -DADIOS2_USE_SST=ON ~/src/ADIOS2
    make install -j8
    cd ~/

    export CMAKE_PREFIX_PATH=~/lib/ADIOS2:$CMAKE_PREFIX_PATH
    export LD_LIBRARY_PATH=~/lib/ADIOS2/lib:$LD_LIBRARY_PATH

# Load openpmd - Loads openPMD version 0.15.0
    cd ~/src
    git clone https://github.com/openPMD/openPMD-api.git
    cd openPMD-api-build
    cmake -DCMAKE_INSTALL_PREFIX=~/lib/openPMD-api -DopenPMD_USE_MPI=ON -DopenPMD_USE_ADIOS2=ON -DopenPMD_USE_HDF5=ON ~/src/openPMD-api
    make install -j8
    cd ~/

    export CMAKE_PREFIX_PATH=~/lib/openPMD-api:$CMAKE_PREFIX_PATH
    export LD_LIBRARY_PATH=~/lib/openPMD-api/lib:$LD_LIBRARY_PATH

