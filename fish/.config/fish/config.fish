set -gx PATH $PATH /usr/local/bin
set -gx PATH $PATH /usr/local/go/bin
set -gx PATH $PATH ~/.local/bin
set -gx PATH $PATH ~/.cargo/bin
set -gx PATH $PATH ~/apps
set -gx PATH $PATH ~/.local/share/pnpm
set -gx PATH $PATH ~/apps/yazi/target/release
set -gx PATH $PATH ~/apps/neovim/build/bin
set -gx PATH $PATH ~/.dotfiles/scripts
set -gx PATH $PATH ~/go/bin
set -gx ELECTRON_OZONE_PLATFORM_HINT auto

set -gx EDITOR /usr/local/bin/nvim

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
alias theme="$HOME/.dotfiles/scripts/set-theme"
alias btop="sudo btop"

# Theme
fish_config theme choose "Rose Pine"
mise activate fish | source

# pnpm
set -gx PNPM_HOME "/home/i0i/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
