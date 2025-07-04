set -gx PATH $PATH /usr/local/bin
set -gx PATH $PATH /usr/local/go/bin
set -gx PATH $PATH ~/.local/bin
set -gx PATH $PATH ~/.cargo/bin
set -gx PATH $PATH ~/apps
set -gx PATH $PATH ~/.local/share/pnpm
set -gx PATH $PATH ~/apps/yazi/target/release
set -gx PATH $PATH ~/apps/neovim/build/bin
set -gx PATH $PATH ~/go/bin
set -gx PATH $PATH ~/.dotfiles/scripts

set -gx ELECTRON_OZONE_PLATFORM_HINT auto
set -gx QT_QPA_PLATFORM wayland
set -gx QT_QPA_PLATFORM offscreen
set -gx LIBVA_DRIVER_NAME radeonsi
set -gx VDPAU_DRIVER radeonsi
set -gx MOZ_ENABLE_WAYLAND 1
set -gx QT_QPA_PLATFORM xcb

set -gx EDITOR /usr/local/bin/nvim

# Aliases
alias py="uv run python"
alias vi="/sbin/vim"
alias vim="CONF=text nvim"
alias poe="uv run poe"
alias ls="ls --color=auto"
alias la="ls -Alhv --group-directories-first --color=auto"
alias ll="ls -vA --group-directories-first --color=auto"

# Tmux
set -gx PATH $PATH ~/.tmux/scripts

alias tm="tmux -L default"
alias tms="tmux -L second"
alias tmls="ls /tmp/tmux-$(id -u)"
alias tmk="tmux kill-session"
alias tmks="tmux kill-server"

bind \cs "tmux-sessionizer"
bind -k nul "tmux-yazi"

alias wifi="nmtui"
alias bt="bluetui"
alias theme="$HOME/.dotfiles/scripts/set-theme"
alias btop="sudo btop"

# Theme
fish_config theme choose "Rose Pine"
# ~/.local/bin/mise activate fish | source

# pnpm
set -gx PNPM_HOME "/home/i0i/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
