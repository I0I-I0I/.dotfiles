zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' expand suffix
zstyle ':completion:*' format '-------------- %d --------------'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'r:|[._-]=** r:|=**' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/nnofly/.zshrc'

autoload -Uz compinit
compinit
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e

# User config

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/apps
export PATH=$PATH:~/.local/share/pnpm
export PATH=$PATH:~/apps/yazi/target/release
export PATH=$PATH:~/apps/neovim/build/bin
export PATH=$PATH:~/.dotfiles/scripts
export PATH=$PATH:~/go/bin
export ELECTRON_OZONE_PLATFORM_HINT=auto

export EDITOR=/usr/local/bin/nvim

# Aliases
alias py="uv run python"
alias vi="/sbin/vim"
alias vim="CONF=text nvim"
alias la="ls -Alhv --group-directories-first --color=auto"
alias ll="ls -vA --group-directories-first --color=auto"
alias poe="uv run poe"

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# Tmux
export PATH=$PATH:~/.tmux/scripts

alias tm="tmux -L default"
alias tms="tmux -L second"
alias tmls="ls /tmp/tmux-$(id -u)"
alias tmk="tmux kill-session"
alias tmks="tmux kill-server"
alias btop="sudo btop"

bindkey -s '^t' "tmux-sessionizer\n"
bindkey -s '^@' "tmux-yazi\n"

autoload -U colors && colors

alias ls="ls --color=auto"
alias la="ls -la --color=auto"

# Setup git status

autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats       '%F{blue}git:(%f%F{red}%b%u%c%f%F{blue})%f '
zstyle ':vcs_info:git:*' actionformats '%b|%a%u%c'

PROMPT='%{$fg[green]%}%   %{$reset_color%}% %F{121%}%2~ %f${vcs_info_msg_0_}%{$fg[blue]%}%{$reset_color%}% '

# Print all available colors
# for code in {000..255}; do
#     print -P -- "$code: %F{$code}Color%f"
# ;done

#
# Plugins
#

# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
