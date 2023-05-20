#!/bin/bash

DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" || exit ; pwd -P )

OH_MY_ZSH_PATH="$HOME/.oh-my-zsh"
if [[ ! -d "$OH_MY_ZSH_PATH" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

POWERLEVEL10K_PATH="${ZSH_CUSTOM:-$OH_MY_ZSH_PATH/custom}/themes/powerlevel10k"
if [[ ! -d "$POWERLEVEL10K_PATH" ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$POWERLEVEL10K_PATH"
fi

ZSHRC_PATH="$HOME/.zshrc"
rm -f "$ZSHRC_PATH"
ln -sf "$DIR/.zshrc" "$ZSHRC_PATH"

FZF_PATH="$HOME/.fzf"
if [[ ! -d "$FZF_PATH" ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git "$FZF_PATH"
  "$FZF_PATH/install" --key-bindings --completion --update-rc
fi
