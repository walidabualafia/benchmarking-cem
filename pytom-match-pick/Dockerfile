# Use mambaforge image for Conda support
FROM condaforge/mambaforge:latest

# Use bash login shell so Conda is initialized
SHELL ["/bin/bash", "-lc"]

# Option 2: install a prebuilt CuPy and CUDA toolkit via conda-forge (self-contained)
RUN mamba create -n pytom_tm \
      python=3 \
      cupy \
      cudatoolkit=11.8 \
      -c conda-forge \
      -y && \
    mamba clean --all -f -y

# Activate the environment and install pytom-match-pick with optional plotting deps
RUN source activate pytom_tm && \
    pip install --no-cache-dir pytom-match-pick[plotting] && \
    conda clean --all -f -y

# Add the env to PATH
ENV PATH=/opt/conda/envs/pytom_tm/bin:$PATH

# Default to interactive shell in pytom_tm
CMD ["bash"]
