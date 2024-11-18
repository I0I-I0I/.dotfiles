set -gx PATH $PATH /usr/local/bin
set -gx PATH $PATH /usr/local/go/bin
set -gx PATH $PATH ~/.local/bin
set -gx PATH $PATH ~/.cargo/bin
set -gx PATH $PATH ~/apps

# Aliases
alias bc="batcat"
alias py="python3"
alias nvim="~/nvim-linux64/bin/nvim"
alias vim="NVIM_APPNAME=nvim-mini nvim"

# Tmux
set -gx PATH $PATH ~/.tmux/scripts

alias tma="tmux attach"
alias tmat="tmux attach -t"
alias tmls="tmux ls"
alias tmk="tmux kill-session"

bind \ct "tmux-sessionizer"
bind -k nul "tmux-yazi"

# Theme
fish_config theme choose "Rose Pine"
