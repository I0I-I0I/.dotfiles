# export ELECTRON_OZONE_PLATFORM_HINT=auto
# export QT_QPA_PLATFORM=wayland
# export QT_QPA_PLATFORM=offscreen
# export LIBVA_DRIVER_NAME=radeonsi
# export VDPAU_DRIVER=radeonsi
# export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=xcb

# export TERM="st-256color"
export COLORTERM=truecolor

# load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors

# cmp opts
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' file-list true # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' expand suffix
zstyle ':completion:*' format '-------------- %d --------------'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'r:|[._-]=** r:|=**' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/nnofly/.zshrc'

# main opts
setopt extendedglob nomatch notify
setopt append_history inc_append_history share_history # better history
# on exit, history appends rather than overwrites; history is appended as soon as cmds executed; history shared across sessions
setopt auto_menu menu_complete # autocmp first menu match
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
setopt prompt_sp # don't autoclean blanklines
stty stop undef # disable accidental ctrl s
unsetopt beep

bindkey -e

HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

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
alias poe="uv run poe"
alias vi="/sbin/vim"
alias vim="CONF=text nvim"
alias ls="ls --color=auto"
alias la="ls -Alhv --group-directories-first --color=auto"
alias ll="ls -vA --group-directories-first --color=auto"
alias httpie-gui="httpie-desktop --enable-features=UseOzonePlatform --ozone-platform=wayland"

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

source <(fzf --zsh)

bindkey -s '^t' "tmux-sessionizer\n"
bindkey -s '^@' "tmux-yazi\n"

autoload -U colors && colors

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

# Plugins

# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# sudo pacman -S zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
