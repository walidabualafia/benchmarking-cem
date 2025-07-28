# Use RHEL8-compatible base image
FROM centos:8

# Install prerequisites: wget, Java, OpenGL libraries
RUN dnf install -y \
      wget \
      bzip2 \
      java-11-openjdk-headless \
      mesa-libGL \
      mesa-libGLU \
      libXrandr \
      libXinerama \
      libXi \
    && dnf clean all

# Set IMOD version and download URL
ENV IMOD_VERSION=5.1.3
ENV IMOD_URL=https://bio3d.colorado.edu/imod/AMD64-RHEL5/imod_${IMOD_VERSION}_RHEL8-64_CUDA12.0.sh

# Download and install IMOD
RUN wget ${IMOD_URL} -O /tmp/imod_installer.sh \
    && chmod +x /tmp/imod_installer.sh \
    # Accept license and install to /usr/local/IMOD
    && yes | /tmp/imod_installer.sh \
    && rm /tmp/imod_installer.sh

# Add IMOD binaries & libraries to the environment
ENV PATH=/usr/local/IMOD/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/IMOD/lib:${LD_LIBRARY_PATH}

# Default to an interactive shell
CMD ["/bin/bash"]
