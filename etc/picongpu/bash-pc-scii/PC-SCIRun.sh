
# Install SCIRun
    cd ~/
    export CMAKE_PREFIX_PATH=~/lib/ADIOS2:$CMAKE_PREFIX_PATH
    export LD_LIBRARY_PATH=~/lib/ADIOS2/lib:$LD_LIBRARY_PATH
    export CMAKE_PREFIX_PATH=~/lib/openPMD-api:$CMAKE_PREFIX_PATH
    export LD_LIBRARY_PATH=~/lib/openPMD-api/lib:$LD_LIBRARY_PATH

    git clone https://github.com/kimjohn1/SCIRun.git
    cd SCIRun
    git checkout old_asynch-PC
    cd bin
    cmake -DQt5_PATH=~/Qt/5.15.2/gcc_64 -DWITH_OSPRAY=OFF ../Superbuild    #use cmake -DQt5_PATH= ... if cmake -DQt_PATH= doesn't work
    make -j8
    cd ~/
