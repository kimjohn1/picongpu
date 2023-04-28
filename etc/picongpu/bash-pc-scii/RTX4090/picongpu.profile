
# Name and Path of this Script ############################### (DO NOT change!)
export PIC_PROFILE=$(cd $(dirname $BASH_SOURCE) && pwd)"/"$(basename $BASH_SOURCE)

# Note: This script is intended to be run from the /Project directory
#       Existing 'scratch' and 'picInputs' directories are deleted only when this 
#       script is run from /Project
#

# Delete existing directories
rm -rf scratch
rm -rf picInputs

# Create directories
mkdir -p /Project/picInputs
mkdir -p /Project/scratch /Project/scratch/runs

# Set variables and paths
#export PIC_BACKEND="omp2b:native"   # running on CPU
#export PIC_BACKEND="cuda:61"        # running on GPU, compute capability 6.1 (GTX 1070)
#export PIC_BACKEND="cuda:75"        # running on GPU, compute capability 7.5 (GTX 2060)
#export PIC_BACKEND="cuda:86"        # running on GPU, compute capability 8.6 (RTX 3060)
export PIC_BACKEND="cuda:89"        # running on GPU, compute capability 8.9 (RTX 4090)

export SCRATCH=/Project/scratch
export PICSRC=/Project/src/picongpu
export PIC_EXAMPLES=$PICSRC/share/picongpu/examples
export PIC_CLONE=/Project/picInputs
export PIC_CFG=etc/picongpu
export PIC_OUTPUT=$SCRATCH/runs

export PATH=$PATH:$PICSRC:$PICSRC/bin:$PICSRC/src/tools/bin
export PYTHONPATH=$PICSRC/lib/python:$PYTHONPATH

export CMAKE_PREFIX_PATH=/Project/lib/ADIOS2:$CMAKE_PREFIX_PATH
export LD_LIBRARY_PATH=/Project/lib/ADIOS2/lib:$LD_LIBRARY_PATH
export CMAKE_PREFIX_PATH=/Project/lib/pngwriter:$CMAKE_PREFIX_PATH
export LD_LIBRARY_PATH=/Project/lib/pngwriter/lib:$LD_LIBRARY_PATH
export CMAKE_PREFIX_PATH=/Project/lib/openPMD-api:$CMAKE_PREFIX_PATH
export LD_LIBRARY_PATH=/Project/lib/openPMD-api/lib:$LD_LIBRARY_PATH

# Set "tbg" default options ######################################
#
export TBG_SUBMIT="bash"
export TBG_TPLFILE="etc/picongpu/bash/mpirun.tpl"

echo PIC_BACKEND is: $PIC_BACKEND from the picongpu.profile

