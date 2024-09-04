set -gx PATH $PATH /usr/local/bin
set -gx PATH $PATH /usr/local/go/bin
set -gx PATH $PATH ~/.local/bin
set -gx PATH $PATH ~/.cargo/bin
set -gx PATH $PATH ~/.tmux/scripts
set -gx PATH $PATH ~/yazi

set -gx todo /mnt/c/Users/azudj/Dropbox/TODO

# Set vim bindings
fish_vi_key_bindings
fish_vi_cursor

# Tmux
alias tma="tmux attach"
alias tmat="tmux attach -t"
alias tmls="tmux ls"
alias tmk="tmux kill-session"

# Aliases
alias man="tldr"
alias bc="batcat"
alias py="python3"
alias prtr='prettier --write "**/*.{js,jsx,ts,tsx,html,css,json}"'
alias nvim="~/nvim-linux64/bin/nvim"
alias vim="NVIM_APPNAME=nvim-mini nvim"

# Binds
bind \cf "tmux-sessionizer"

# Theme
fish_config theme choose "Rose Pine"
