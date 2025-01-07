set -gx PATH $PATH /usr/local/bin
set -gx PATH $PATH /usr/local/go/bin
set -gx PATH $PATH ~/.local/bin
set -gx PATH $PATH ~/.cargo/bin
set -gx PATH $PATH ~/apps
set -gx PATH $PATH ~/.local/share/pnpm
set -gx PATH $PATH ~/apps/yazi/target/release
set -gx PATH $PATH ~/apps/neovim/build/bin

# Aliases
alias py="python3"
alias vim="nvim"
alias mkdir="mkdir -p"

# Tmux
set -gx PATH $PATH ~/.tmux/scripts

alias tma="tmux attach"
alias tmat="tmux attach -t"
alias tmls="tmux ls"
alias tmk="tmux kill-session"
alias tmks="tmux kill-server"

bind \ct "tmux-sessionizer"
bind -k nul "tmux-yazi"

# Theme
fish_config theme choose "Rose Pine"

alias wifi="nmtui"
alias bt="bluetui"
alias light="brightnessctl set"
