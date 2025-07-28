BootStrap: docker
From: nvidia/cuda:12.6.2-devel-rockylinux8

%labels
    Maintainer "Walid Abu Al-Afia"

%environment
    export CUDA_HOME=/usr/local/cuda
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/cuda/lib:$LD_LIBRARY_PATH
    export PATH=/opt/AreTomo3:$PATH

%post
    echo "Updating system and installing dependencies..."
    yum update -y && \
    yum install -y \
        git \
        make \
        gcc \
        gcc-c++ \
        libstdc++-devel \
        libtiff-devel && \
    yum clean all

    echo "Cloning AreTomo3 repository..."
    cd /opt
    git clone https://github.com/czimaginginstitute/AreTomo3.git

    echo "Building AreTomo3..."
    cd /opt/AreTomo3
    make exe -f makefile11 CUDAHOME=/usr/local/cuda

%runscript
    exec /opt/AreTomo3/AreTomo3 "$@"
