fish_add_path -g \
    $HOME/.dotfiles/scripts \
    $HOME/.local/bin \
    $HOME/.cargo/bin \
    $HOME/apps/v2rayN-linux-64 \
    $HOME/go/bin \
    $HOME/apps/bin \
    $HOME/.bun/bin \
    $HOME/.opencode/bin \

set -gx ANDROID_SDK_ROOT "$HOME/apps/android-tools/"
fish_add_path -g \
    $ANDROID_SDK_ROOT/platform-tools \
    $ANDROID_SDK_ROOT/emulator \
    $ANDROID_SDK_ROOT/cmdline-tools/bin

set -gx PNPM_HOME "$HOME/.local/share/pnpm"
fish_add_path -g $PNPM_HOME

if status is-interactive
  stty -ixon
  # bind \cs '__tmux_sessionizer'
  bind \cs '__zoxide'
end

function __zoxide
  commandline -r 'zi'
  commandline -f execute
end

function __tmux_sessionizer
  commandline -r 'tmux-sessionizer'
  commandline -f execute
end

if test -f "$HOME/Secure/.secure-keys"
  source "$HOME/Secure/.secure-keys"
end

if test -f "$HOME/.cargo/env.fish"
  source "$HOME/.cargo/env.fish"
end

set -gx QT_QPA_PLATFORM "xcb"
set -gx ELECTRON_OZONE_PLATFORM_HINT "auto"
set -gx MOZ_ENABLE_WAYLAND "1"
set -gx LIBVA_DRIVER_NAME "radeonsi"
set -gx VDPAU_DRIVER "radeonsi"

set -gx EDITOR "/usr/local/bin/nvim"

function codex
    HTTP_PROXY=http://127.0.0.1:10808 HTTPS_PROXY=http://127.0.0.1:10808 command codex $argv
end

alias open='xdg-open'
alias py='uv run python'
alias vim='nvim'
alias ls='ls -p --group-directories-first --color=always'
alias la='ls -Alhvp --group-directories-first --color=always'
alias share='python3 -m http.server 8000 & sleep 1; ngrok http 8000'
alias cd='z'

zoxide init fish | source
