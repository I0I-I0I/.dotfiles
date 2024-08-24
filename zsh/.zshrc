#!/bin/zsh

# Path

setopt appendhistory

export KITTY_BIN="/opt/kitty.app/bin"
export NEOVIDE_MAXIMIZED=true
export NEOVIM_BIN="/opt/nvim-linux64/bin"
export ZSH="$HOME/.oh-my-zsh"
export OLLAMA_MODELS="/mnt/d/code/ollama"
export TMUX_SCRIPTS=$HOME/.tmux/scripts
export GO=/usr/local/go/bin
export LAZY_GIT=$HOME/lazygit
export FISH=$HOME/fish-3.7.0/fish
export PATH=$LAZY_GIT:$GO:$FISH:$KITTY_BIN:$TMUX_SCRIPTS:$NEOVIM_BIN:$HOME/.config/nvim:$PATH:/home/i0i/.local/bin:$HOME/bin:/usr/local/bin:/home/i0i/.cargo/bin

export EDITOR="neovim"
export VPN_IP="80.209.240.101"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# zsh-vi-mode
plugins=(zsh-syntax-highlighting git zsh-autosuggestions zsh-z)

source $ZSH/oh-my-zsh.sh

# Path

export profile=/mnt/c/Users/azudj/Documents/PowerShell/Microsoft.PowerShell_profile.ps1
export term=/mnt/c/Users/azudj/AppData/Local/Microsoft/Windows\ Terminal
export neovideConfig=/mnt/c/Users/azudj/AppData/Roaming/neovide

# Aliases
alias man="tldr"
alias bc="batcat"
alias py="python3"
alias pip="python3 -m pip"
alias lt="ls --level=99"
alias so="source ~/.zshrc"


alias yazi="~/yazi/yazi"
alias untar="tar xzvf"

# Tmux
alias tmd="tmux new -A -t A_default"
alias tma="tmux attach"
alias tmat="tmux attach -t"
alias tmls="tmux ls"
alias tmk="tmux kill-session -t"

alias tsj="tmux-start-job"
alias tsjd="tsj Development"
alias tsjc="tsj Console"

alias prtr='prettier --write "**/*.{js,jsx,ts,tsx,html,css,json}"'

# Nvim
alias nvim="neovim -u ~/.config/nvim/lua/main/init.lua"
alias vim="~/nvim-linux64/bin/nvim"
alias code="/mnt/c/Program\ Files/Neovide/neovide.exe --neovim-bin /opt/nvim-linux64/bin/neovim --wsl --frame none --maximized"

# LSP
export PATH=$PATH:$HOME/lsp_servers/lua-language-server/bin

# for tmux
bindkey -s  "tmux-sessionizer\n"
bindkey -s ^G "tmux-lazygit\n"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
