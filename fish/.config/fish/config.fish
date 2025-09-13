set -gx PATH $PATH ~/.local/share/pnpm
set -gx PATH $PATH ~/.dotfiles/scripts
set -gx PATH $PATH ~/.local/bin
set -gx PATH $PATH ~/.local/share/nvim/mason/bin

set -gx GTK_THEME Adwaita:dark
set -gx GTK2_RC_FILES /usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
set -gx QT_STYLE_OVERRIDE Adwaita-Dark
set -gx ELECTRON_OZONE_PLATFORM_HINT auto
set -gx QT_QPA_PLATFORM wayland
set -gx QT_QPA_PLATFORM offscreen
set -gx LIBVA_DRIVER_NAME radeonsi
set -gx VDPAU_DRIVER radeonsi
set -gx MOZ_ENABLE_WAYLAND 1
set -gx QT_QPA_PLATFORM xcb

set -gx EDITOR /usr/local/bin/nvim

alias py="uv run python"
alias vi="/sbin/vim"
alias vim="CONF=code nvim"
alias la="ls -Alhv --group-directories-first --color=auto"
alias ll="ls -vA --group-directories-first --color=auto"

bind \cs "tmux-sessionizer"

fish_config theme choose "Rose Pine"

source ~/secure/.secure-keys
tmux new -s main -d 2>/dev/null
