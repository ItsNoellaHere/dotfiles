XDG_CONFIG_HOME=$HOME/.config

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Paste Configs
mkdir -p $XDG_CONFIG_HOME/alacritty
cp -r ./alacritty/* $XDG_CONFIG_HOME/alacritty
mkdir -p $XDG_CONFIG_HOME/nvim
cp -r ./nvim-conf/* $XDG_CONFIG_HOME/nvim
mkdir -p $XDG_CONFIG_HOME/tmux
cp -r ./tmux/* $XDG_CONFIG_HOME/tmux
cp ./zsh/.zshenv $HOME/.zshenv
cp ./zsh/.p10k.zsh $HOME/.p10k.zsh
mkdir -p $XDG_CONFIG_HOME/zsh
cp ./zsh/.zshrc $XDG_CONFIG_HOME/zsh

# Add Custom plugins
mkdir -p $HOME/.oh-my-zsh
cp -r ./zsh/custom/ $HOME/.oh-my-zsh

# Install Rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# Install and use Neovim nightly
cargo install bob-nvim
bob install nightly
bob use nightly

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Use nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Install Node
nvm install --lts
nvm use --lts
nvm alias default lts/*

env zsh -l
