# Use the mambaforge base image for conda support
FROM condaforge/mambaforge:latest

# Create a new conda environment "cryocare_11" with Python 3.8 and CUDA 11/CuDNN 8
RUN mamba create -n cryocare_11 \
      python=3.8 \
      cudatoolkit=11.0 \
      cudnn=8.0 \
      -c conda-forge \
      -y && \
    mamba clean --all -f -y

# Activate the environment, install TensorFlow 2.4 and cryoCARE via pip
RUN /bin/bash -lc "\
    conda activate cryocare_11 && \
    pip install --no-cache-dir tensorflow==2.4 cryoCARE && \
    conda clean --all -f -y"

# Ensure the conda environment is automatically activated in subsequent shells
ENV PATH=/opt/conda/envs/cryocare_11/bin:$PATH

# Default to an interactive shell
CMD ["bash"]
