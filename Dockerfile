# Use NVIDIA CUDA 12.6.2 (RockyLinux 8) as base
FROM nvidia/cuda:12.6.2-devel-rockylinux8

LABEL maintainer="Walid Abu Al-Afia"

# Set environment variables to put CUDA in path
ENV CUDA_HOME=/usr/local/cuda
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/cuda/lib:$LD_LIBRARY_PATH

# Install necessary dependencies
RUN yum update -y && \
    yum install -y \
    git \
    make \
    gcc \
    gcc-c++ \
    libstdc++-devel \
    libtiff-devel && \
    yum clean all

# Clone the AreTomo3 repository
WORKDIR /opt
RUN git clone https://github.com/czimaginginstitute/AreTomo3.git

# Set working directory
WORKDIR /opt/AreTomo3

# Build the AreTomo3 executable
RUN make exe -f makefile11 CUDAHOME=$CUDA_HOME

# Add AreTomo3 to path
ENV PATH=/opt/AreTomo3:$PATH

# Reset the working directory to default
WORKDIR /

# Set entrypoint 
ENTRYPOINT ["AreTomo3"]

# CMD to provide a default action 
CMD ["--help"]
