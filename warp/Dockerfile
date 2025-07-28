# Use the conda-forge mambaforge base image
FROM condaforge/mambaforge:latest

# Create a new environment "warp" and install WarpTools v2.0.0
# from the specified channels (warpem, nvidia CUDA 11.8, PyTorch, conda-forge)
RUN mamba create -n warp warp=2.0.0 \
      -c warpem \
      -c nvidia/label/cuda-11.8.0 \
      -c pytorch \
      -c conda-forge \
      -y && \
    mamba clean --all -f -y

# Make the "warp" environment the default for all future shells
ENV PATH=/opt/conda/envs/warp/bin:$PATH

# Default to an interactive bash shell in the warp environment
CMD ["bash"]
