export PATH="$PATH:$HOME/.dotfiles/scripts:$HOME/.local/bin:$HOME/.local/share/nvim/mason/bin:$HOME/.cargo/bin:$HOME/apps/v2rayN-linux-64/"

# export GTK_THEME="Adwaita:dark"
# export QT_STYLE_OVERRIDE="Adwaita-Dark"
export QT_QPA_PLATFORM="xcb"
export ELECTRON_OZONE_PLATFORM_HINT="auto"
export MOZ_ENABLE_WAYLAND="1"
export LIBVA_DRIVER_NAME="radeonsi"
export VDPAU_DRIVER="radeonsi"

export EDITOR="/usr/local/bin/nvim"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[\033[38;2;133;153;0m\]\w\$(parse_git_branch)\[\033[0m\] " # solarized-osaka

export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

alias py="uv run python"
alias vi="/sbin/vim"
alias vim="nvim"
alias ls="ls -p --group-directories-first --color=always"
alias la="ls -Alhvp --group-directories-first --color=always"

bind -x '"\C-s":"tmux-sessionizer"'

eval "$(fzf --bash)"

[ -t 0 ] && stty -ixon
[ -f "$HOME/Secure/.secure-keys" ] && . "$HOME/Secure/.secure-keys"
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# pnpm
export PNPM_HOME="/home/nnofly/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
. "$HOME/.cargo/env"
