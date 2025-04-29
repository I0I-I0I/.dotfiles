set -gx PATH $PATH /usr/local/bin
set -gx PATH $PATH /usr/local/go/bin
set -gx PATH $PATH ~/.local/bin
set -gx PATH $PATH ~/.cargo/bin
set -gx PATH $PATH ~/apps
set -gx PATH $PATH ~/.local/share/pnpm
set -gx PATH $PATH ~/apps/yazi/target/release
set -gx PATH $PATH ~/apps/neovim/build/bin
set -gx PATH $PATH ~/.dotfiles/fish/.config/fish/scripts
set -gx PATH $PATH ~/go/bin

set -gx EDITOR /sbin/vim

# Aliases
alias py="python3"
alias mkdir="mkdir -p"
alias vi="/sbin/vim"
alias vim="nvim"
alias tim="CONF=code nvim"
alias drop="dropbox-cli"
alias cloc="cloc --exclude_dir=node_modules,.git,libs,package-lock.json,pnpm-lock.yaml,tags,tsconfig.node.json,tsconfig.tsbuildinfo,compile_commands.json,build"
alias la="ls -Alhv --group-directories-first --color=auto"
alias ll="ls -vA --group-directories-first --color=auto"

# Tmux
set -gx PATH $PATH ~/.tmux/scripts

alias tm="tmux -L default"
alias tms="tmux -L second"
alias tmls="ls /tmp/tmux-$(id -u)"
alias tmk="tmux kill-session"
alias tmks="tmux kill-server"

bind \ct "tmux-sessionizer"
bind -k nul "tmux-yazi"

alias wifi="nmtui"
alias bt="bluetui"
alias music="yamusic-tui"
alias theme="$HOME/.dotfiles/scripts/set-theme"
alias btop="sudo btop"

# Theme
fish_config theme choose "Rose Pine"
~/.local/bin/mise activate fish | source

# pnpm
set -gx PNPM_HOME "/home/i0i/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
