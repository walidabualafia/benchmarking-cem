# Use NVIDIA CUDA 12.0 base image with development toolkit
FROM nvidia/cuda:12.0-devel-centos8

# Use bash login shell
SHELL ["/bin/bash", "-lc"]

# Install prerequisites: wget, tar, bzip2, Java, OpenGL libraries
RUN yum install -y \
      wget \
      tar \
      bzip2 \
      java-11-openjdk-headless \
      mesa-libGL \
      mesa-libGLU \
      libXrandr \
      libXinerama \
      libXi && \
    yum clean all && \
    rm -rf /var/cache/yum

# Set IMOD version and installer URL for RHEL8/CUDA12.0
ENV IMOD_VERSION=5.1.3
ENV IMOD_BUILD=RHEL8-64_CUDA12.0
ENV IMOD_URL=https://bio3d.colorado.edu/imod/AMD64-RHEL5/imod_${IMOD_VERSION}_${IMOD_BUILD}.sh

# Download and install IMOD
RUN mkdir -p /imod && \
    wget -O /imod/imod_installer.sh "$IMOD_URL" && \
    chmod +x /imod/imod_installer.sh && \
    # extract embedded tarball
    sh /imod/imod_installer.sh -yes && \
    # unpack into /usr/local
    #tar -xzf /IMODtempDir/imod_${IMOD_VERSION}_${IMOD_BUILD}.tar.gz -C /usr/local && \
    # create standard IMOD directory
    #ln -s /usr/local/imod_${IMOD_VERSION} /usr/local/IMOD && \
    # copy profile scripts
    #cp /usr/local/IMOD/IMOD-linux.* /etc/profile.d/ && \
    # cleanup
    rm -rf /imod /IMODtempDir

# Add IMOD binaries and libraries to environment
ENV PATH=/usr/local/IMOD/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/IMOD/lib:${LD_LIBRARY_PATH}

# Default to interactive shell
CMD ["bash"]
