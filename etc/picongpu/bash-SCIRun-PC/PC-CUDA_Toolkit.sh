
#Install the CUDA Toolkit
    cd ~/
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
    sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
    wget https://developer.download.nvidia.com/compute/cuda/11.7.1/local_installers/cuda-repo-ubuntu2204-11-7-local_11.7.1-515.65.01-1_amd64.deb
    sudo dpkg -i cuda-repo-ubuntu2204-11-7-local_11.7.1-515.65.01-1_amd64.deb
    sudo cp /var/cuda-repo-ubuntu2204-11-7-local/cuda-*-keyring.gpg /usr/share/keyrings/
    apt update
    DEBIAN_FRONTEND=noninteractive apt -y install cuda
    cd ~/

#Set the Cuda Toolkit path using the following steps
#    sudo su
#    echo "export PATH=/usr/local/cuda-11.7/bin${PATH:+:${PATH}}" >> /etc/profile
#    reboot
