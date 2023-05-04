
#Install the CUDA Toolkit
    cd /Project
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
    sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
    wget https://developer.download.nvidia.com/compute/cuda/12.1.0/local_installers/cuda-repo-ubuntu2204-12-1-local_12.1.0-530.30.02-1_amd64.deb
    sudo dpkg -i cuda-repo-ubuntu2204-12-1-local_12.1.0-530.30.02-1_amd64.deb
    sudo cp /var/cuda-repo-ubuntu2204-12-1-local/cuda-*-keyring.gpg /usr/share/keyrings/
    apt update
    DEBIAN_FRONTEND=noninteractive apt -y install cuda
    cd /Project

#Set the Cuda Toolkit path using the following steps
#    sudo su
#    echo "export PATH=/usr/local/cuda-12.1/bin${PATH:+:${PATH}}" >> /etc/profile
#    exit
#    reboot
