.ONESHELL:
SHELL = /bin/zsh
CONDA_ACTIVATE = source $$(conda info --base)/etc/profile.d/conda.sh ; conda activate ; conda activate

all: env install

env: 
	@conda create -n cde python=3.7
	conda init bash

install:
	$(CONDA_ACTIVATE) cde
	@conda install -c anaconda protobuf
	@pip install -r requirements.txt

clean:
	rm -rf __pycache__
	rm -f *.pyc
	rm -f *.log
	conda deactivate
	conda env remove -n cde