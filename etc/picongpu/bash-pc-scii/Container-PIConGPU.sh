
# Create directories
    mkdir -p /Project/src/openPMD-api /Project/src/openPMD-api-build
    mkdir -p /Project/src/pngwriter /Project/src/pngwriter-build
    mkdir -p /Project/src/ADIOS2 /Project/src/ADIOS2-build
    mkdir -p /Project/lib/openPMD-api
    mkdir -p /Project/lib/pngwriter
    mkdir -p /Project/lib/ADIOS2
    export SCRATCH=/Project/scratch
    mkdir -p /Project/picInputs
    mkdir -p $SCRATCH/runs

# Set system variables
    export PICSRC=/Project/src/picongpu
    export PIC_EXAMPLES=$PICSRC/share/picongpu/examples
    #export PIC_BACKEND="omp2b:native"
    #export PIC_BACKEND="cuda:61"
    export PIC_BACKEND="cuda:86"
    export PIC_CLONE=/Project/picInputs
    export PIC_CFG=etc/picongpu
    export PIC_OUTPUT=$SCRATCH/runs

    export PATH=$PATH:$PICSRC:$PICSRC/bin:$PICSRC/src/tools/bin
    export PYTHONPATH=$PICSRC/lib/python:$PYTHONPATH

# Load gcc - accomplished in Dependencies
#    apt -y install build-essential

# Load CMake - accomplished in Dependencies
#    apt -y install cmake file cmake-curses-gui

# Load openmpi
    apt -y install libopenmpi-dev

# Load zlib
    apt -y install zlib1g-dev

# Load boost Installs version 1.74.0
    apt -y install libboost-program-options-dev libboost-filesystem-dev libboost-system-dev libboost-math-dev libboost-serialization-dev

# Load git - accomplished in Dependencies
#    apt -y install git

# Load rsync - accomplished in Dependencies
#    apt -y install rsync

# Retrieve PIConGPU source code and change to the -dev branch
    cd /Project/src
    git clone https://github.com/kimjohn1/picongpu.git
    cd picongpu
    git checkout container_2
    cd /Project/

# Load libpng
    cd /Project/
    apt -y install libpng-dev

# Load pngwriter
    cd /Project/src
    git clone https://github.com/pngwriter/pngwriter.git
    cd pngwriter-build
    cmake -DCMAKE_INSTALL_PREFIX=/Project/lib/pngwriter /Project/src/pngwriter
    make install -j8
    cd /Project/

    export CMAKE_PREFIX_PATH=/Project/lib/pngwriter:$CMAKE_PREFIX_PATH
    export LD_LIBRARY_PATH=/Project/lib/pngwriter/lib:$LD_LIBRARY_PATH

# Load hdf5 - apt installs version 1.10.4
    cd /Project/
    apt -y install libhdf5-openmpi-dev

# Load ADIOS2 - installs latest version
    cd /Project/src
    git clone https://github.com/ornladios/ADIOS2.git ADIOS2
    cd ADIOS2-build
    cmake -DCMAKE_INSTALL_PREFIX=/Project/lib/ADIOS2 -DADIOS2_USE_Fortran=OFF -DADIOS2_USE_PNG=OFF -DADIOS2_USE_BZip2=OFF -DADIOS2_USE_SST=ON /Project/src/ADIOS2
    make install -j8
    cd /Project/

    export CMAKE_PREFIX_PATH=/Project/lib/ADIOS2:$CMAKE_PREFIX_PATH
    export LD_LIBRARY_PATH=/Project/lib/ADIOS2/lib:$LD_LIBRARY_PATH

# Load openpmd - Loads openPMD version 0.15.0
    cd /Project/src
    git clone https://github.com/openPMD/openPMD-api.git
    cd openPMD-api-build
    cmake -DCMAKE_INSTALL_PREFIX=/Project/lib/openPMD-api -DopenPMD_USE_MPI=ON -DopenPMD_USE_ADIOS2=ON -DopenPMD_USE_HDF5=ON /Project/src/openPMD-api
    make install -j8
    cd /Project/

    export CMAKE_PREFIX_PATH=/Project/lib/openPMD-api:$CMAKE_PREFIX_PATH
    export LD_LIBRARY_PATH=/Project/lib/openPMD-api/lib:$LD_LIBRARY_PATH

