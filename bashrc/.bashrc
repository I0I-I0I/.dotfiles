export PATH="$PATH:$HOME/.dotfiles/scripts:$HOME/.local/bin:$HOME/.local/share/nvim/mason/bin:$HOME/.cargo/bin:$HOME/apps/v2rayN-linux-64/"

# export GTK_THEME="Adwaita:dark"
# export QT_STYLE_OVERRIDE="Adwaita-Dark"
export QT_QPA_PLATFORM="xcb"
export ELECTRON_OZONE_PLATFORM_HINT="auto"
export MOZ_ENABLE_WAYLAND="1"
export LIBVA_DRIVER_NAME="radeonsi"
export VDPAU_DRIVER="radeonsi"

export EDITOR="/usr/local/bin/nvim"

export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

alias py="uv run python"
alias vi="/sbin/vim"
alias vim="nvim"
alias ls="ls --group-directories-first --color=no"
alias la="ls -Alhv --group-directories-first --color=no"
# alias l="ls -vA --group-directories-first --color=no"
alias cz="git-cz --disable-emoji"

[ -t 0 ] && stty -ixon

bind -x '"\C-s":"tmux-sessionizer"'

[ -f "$HOME/Secure/.secure-keys" ] && . "$HOME/Secure/.secure-keys"
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

eval "$(fzf --bash)"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\u@\h:\w \$(parse_git_branch)$ " # no colors
# export PS1="\[\033[38;2;42;162;152m\]\u\[\033[38;2;220;49;46m\]@\[\033[38;2;39;139;211m\]\h:\[\033[38;2;133;153;0m\]\w \[\033[38;2;220;49;46m\]\$(parse_git_branch)\[\033[0m\]$ " # solarized-osaka

# pnpm
export PNPM_HOME="/home/nnofly/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
