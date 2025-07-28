# Use Mambaforge for fast conda installs
FROM condaforge/mambaforge:latest

# Use bash login shell so conda is initialized
SHELL ["/bin/bash", "-lc"]

# Install IMOD 5.1.3 from bioconda/conda-forge
RUN mamba install -y \
      -c conda-forge \
      -c bioconda \
      conda-forge::imod && \
    mamba clean --all -f -y

# Verify that imod is on PATH
RUN which imod && imod --version

# Default to an interactive shell
CMD ["bash"]
