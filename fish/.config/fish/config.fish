set -gx PATH $PATH ~/.local/share/pnpm
set -gx PATH $PATH ~/.dotfiles/scripts
set -gx PATH $PATH ~/.local/bin
set -gx PATH $PATH ~/.local/share/nvim/mason/bin

set -gx ELECTRON_OZONE_PLATFORM_HINT auto
set -gx QT_QPA_PLATFORM wayland
set -gx QT_QPA_PLATFORM offscreen
set -gx LIBVA_DRIVER_NAME radeonsi
set -gx VDPAU_DRIVER radeonsi
set -gx MOZ_ENABLE_WAYLAND 1
set -gx QT_QPA_PLATFORM xcb

set -gx EDITOR /usr/local/bin/nvim
set -gx PATH $PATH ~/.tmux/scripts

alias py="uv run python"
alias vi="/sbin/vim"
alias vim="CONF=code nvim"
alias poe="uv run poe"
alias la="ls -Alhv --group-directories-first --color=auto"
alias ll="ls -vA --group-directories-first --color=auto"
alias tmk="tmux kill-session"
alias tmks="tmux kill-server"

bind \cs "tmux-sessionizer"

fish_config theme choose "Rose Pine"

# tmux new -s main 2>/dev/null || tmux attach -t main 2>/dev/null

# pnpm
set -gx PNPM_HOME "/home/i0i/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

source ~/.secure-keys
