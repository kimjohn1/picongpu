
# Install SCIRun
    cd /Project
    export CMAKE_PREFIX_PATH=/Project/lib/ADIOS2:$CMAKE_PREFIX_PATH
    export LD_LIBRARY_PATH=/Project/lib/ADIOS2/lib:$LD_LIBRARY_PATH
    export CMAKE_PREFIX_PATH=/Project/lib/openPMD-api:$CMAKE_PREFIX_PATH
    export LD_LIBRARY_PATH=/Project/lib/openPMD-api/lib:$LD_LIBRARY_PATH

    git clone https://github.com/kimjohn1/SCIRun.git
    cd SCIRun
    git checkout container_2
    cd bin
    cmake -DQt5_PATH=/Project/Qt/5.15.2/gcc_64 -DWITH_OSPRAY=OFF ../Superbuild    #use cmake -DQt5_PATH= ... if cmake -DQt_PATH= doesn't work
    make -j8
    cd /Project
