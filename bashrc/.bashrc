export PATH="$PATH:$HOME/.local/share/pnpm:$HOME/.dotfiles/scripts:$HOME/.local/bin:$HOME/.local/share/nvim/mason/bin"

export GTK_THEME="Adwaita:dark"
export GTK2_RC_FILES="/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc"
export QT_STYLE_OVERRIDE="Adwaita-Dark"
export ELECTRON_OZONE_PLATFORM_HINT="auto"
export QT_QPA_PLATFORM="xcb"
export LIBVA_DRIVER_NAME="radeonsi"
export VDPAU_DRIVER="radeonsi"
export MOZ_ENABLE_WAYLAND="1"

export EDITOR="/usr/local/bin/nvim"
export HISTFILESIZE=-1

alias py="uv run python"
alias vi="/sbin/vim"
alias vim="CONF=code nvim"
alias la="ls -Alhv --group-directories-first --color=auto"
alias l="ls -vA --group-directories-first --color=auto"

[ -t 0 ] && stty -ixon

bind -x '"\C-s":"tmux-sessionizer"'

[ -f "$HOME/secure/.secure-keys" ] && . "$HOME/secure/.secure-keys"
[ -f "/usr/share/bash-completion/bash_completion" ] && . "/usr/share/bash-completion/completions/git"
[ -f "/etc/bash_completion.d/git" ] && . "/etc/bash_completion.d/git"
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

if command -v tmux >/dev/null 2>&1; then
  tmux new -s main -d 2>/dev/null || true
fi

eval "$(fzf --bash)"

[[ $- != *i* ]] && return

FNM_PATH="/home/nnofly/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
