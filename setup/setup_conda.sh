#!/bin/bash

# borrowed from:
# https://gitlab.cern.ch/atlas-flavor-tagging-tools/algorithms/ftag-tracking-studies/-/blob/master/setup_conda.sh

# install mamba locally if it doesn't already exist
CONDA_INSTALL=$PWD/conda/
#https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
if [[ ! -d "${CONDA_INSTALL}" ]]; then
  CONDA_REPOSITORY=https://github.com/conda-forge/miniforge/releases/latest/download
  # installation for macOS (including support for M1 MacBooks)
  CONDA_INSTALLER="Miniforge3-Linux-x86_64.sh"
  # other operating system not supported
  #else
  #  echo "Operating system not supported. Setup not possible."
  #  exit 1
  #fi
  # install mamba to local directory
  echo "Running curl"
  curl -L -O ${CONDA_REPOSITORY}/${CONDA_INSTALLER}
  echo "Running Bash"
  bash ${CONDA_INSTALLER} -b -p ${CONDA_INSTALL}
  echo "Cleaning up"
  rm ${CONDA_INSTALLER}
fi

# set up conda environment
source ${CONDA_INSTALL}/bin/activate
