# FCCHBBTAUTAU

MPHYS project on HH->bbtautau MVA for FCC-hh

# Instructions

## Log on to HEP machines

```bash
# Logon to alpha machine
ssh <username>@gateway.ph.liv.ac.uk
ssh alpha
```
Where you have to replace `<username>` with your username on the liverpool physics cluster which you got from the helpdesk.   You can also do this on your laptop, if you download the data, but `alpha` has more CPU and also severl GPUs that might be useful for faster training. 

## First time setup

```bash
# Download this package
git clone https://github.com/jd550179/FCCHBBTAUTAU.git
cd FCCHBBTAUTAU

# Set up a virtual environment
source setup/setup_conda.sh
mamba create -n FCCHH python=3.10

# Acivate the virtual enviroment
conda activate FCCHH

# Install required packages
pip install pyg_lib torch_scatter torch_sparse torch_cluster torch_spline_conv -f https://data.pyg.org/whl/torch-2.2.0+cu121.html
python -m pip install -e .
```

## Subsequent setup

```bash

# Resetup conda
source setup.sh

# Reacivate the virtual enviroment
conda activate FCCHH
```

## Running

```bash

# On alpha, run jupyter lab with no browser
# (you may need to use another port 88XX if 8888 is taken)
jupyter lab --no-browser --port 8888

# On your laptop create an ssh tunnel to alpha 
# ... from on-site you can simply do
ssh -L 8888:localhost:8888 <userame>@alpha.ph.liv.ac.uk cat -
# ... while from offsite it needs two commands
ssh -L2222:alpha:22 <username>@gateway.ph.liv.ac.uk cat -
ssh -p2222 -L8888:localhost:8888 <username>@localhost cat -

# Point your local web browser to localhost:8888 to access jupyter
# and paste in the token displayed in the terminal on alpha

# Start by looking at examples/Playground.ipynb
```




