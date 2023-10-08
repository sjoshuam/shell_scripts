#!/bin/bash

## Before running: chmod +x setup.sh

cd ~

echo "== Configure SSH Key ========"
mkdir .ssh
ssh-keygen -t ed25519 -C "sjoshuam@github.com" -f ~/.ssh/id_ed25519
git config --global user.email sjoshuam@github.com
git config --global user.name sjoshuam
echo "COPY THIS KEY TO GITHUB"
cat ~/.ssh/id_ed25519.pub

echo "== Install Software components ========"
echo 'TODO: EVALUATE IF HOMEBREW SHOULD BE INSTALLED'

echo "== Cloning Projects ========"
mkdir ~/Coding
cd ~/Coding
git clone https://github.com/sjoshuam/portfolio.git
git clone https://github.com/sjoshuam/travel_weather
git clone https://github.com/sjoshuam/life_expectancy.git
git clone https://github.com/sjoshuam/us_travels.git
cd ~

echo "== Installing Miniconda ========"
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh > miniconda.sh
bash miniconda.sh -b -p ~/miniconda
rm miniconda.sh
source ~/miniconda/bin/activate
conda init zsh
source ~/.zshrc

echo "== Installing Libmamba Conda Solver ========"
conda config --set solver classic
conda update conda -y
conda install -y -n base conda-libmamba-solver
conda config --set solver libmamba
source ~/.zshrc

echo "== Installing Conda Python Build ========"
conda create -y --name py python=3.11 pandas scikit-learn plotly
conda activate py
echo "conda activate py" >> .zshrc
echo 'alias py=~/miniconda3/envs/py/bin/python3.11' >> .zshrc
