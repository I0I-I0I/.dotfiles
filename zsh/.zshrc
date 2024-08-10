# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.

#!/bin/zsh

# Path

setopt appendhistory

export KITTY_BIN="/opt/kitty.app/bin"
export NEOVIDE_MAXIMIZED=true
export NEOVIM_BIN="/opt/nvim-linux64/bin"
export ZSH="$HOME/.oh-my-zsh"
export FZF_DEFAULT_COMMand='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
export OLLAMA_MODELS="/mnt/d/code/ollama"
export PATH=$KITTY_BIN:$NEOVIM_BIN:$HOME/.config/nvim:$PATH:/home/i0i/.local/bin:$HOME/bin:/usr/local/bin:/home/i0i/.cargo/bin

export EDITOR="neovim -u ~/.config/nvim/lua/mini/init.lua"
export VPN_IP="80.209.240.101"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# zsh-vi-mode
plugins=(zsh-exa zsh-syntax-highlighting git zsh-autosuggestions web-search zsh-z)

source $ZSH/oh-my-zsh.sh

#/bin/sh/bash

# User

# Path

export profile=/mnt/c/Users/azudj/Documents/PowerShell/Microsoft.PowerShell_profile.ps1
export term=/mnt/c/Users/azudj/AppData/Local/Microsoft/Windows\ Terminal
export neovideConfig=/mnt/c/Users/azudj/AppData/Roaming/neovide

export react=/mnt/d/code/learning/react/

# Github
export Gulp=https://github.com/I0I-I0I/gulp

alias man="tldr"
alias bc="batcat"
alias py="python3"
alias pip="python3 -m pip"
alias ls="eza --tree --level=1 --color=always --long --git --icons=always --no-filesize --no-time --no-user --no-permissions --ignore-glob='node_modules'"
alias la="ls -a"
alias lt="ls --level=99"
alias so="source ~/.zshrc"

alias yazi="~/yazi/yazi"
alias untar="tar xzvf"

alias tmc="tmux new -s default"
alias tma="tmux attach -t default"

# Nvim
alias nvim="neovim -u ~/.config/nvim/lua/main/init.lua"
alias vim="~/nvim-linux64/bin/nvim"
alias code="/mnt/c/Program\ Files/Neovide/neovide.exe --neovim-bin /opt/nvim-linux64/bin/neovim --wsl --frame none --maximized"

# LSP
export PATH=$PATH:$HOME/lsp_servers/lua-language-server/bin

# fzf

_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd) fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
        export|unset) fzf --preview "eval 'echo \$' {}" "$@" ;;
        ssh) fzf --preview 'dig {}' "$@" ;;
        *) fzf --preview "--preview 'bat -n --color=always --line-range :500 {}'" "$@" ;;
    esac
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
