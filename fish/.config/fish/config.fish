set -gx NEOVIDE_MAXIMIZED true
set -gx PATH $PATH /opt/kitty.app/bin
set -gx PATH $PATH /opt/nvim-linux64/bin
set -gx PATH $PATH ~/.oh-my-zsh
set -gx PATH $PATH /mnt/d/code/ollama
set -gx PATH $PATH $HOME/.tmux/scripts
set -gx PATH $PATH /usr/local/go/bin
set -gx PATH $PATH ~/lazygit
set -gx PATH $PATH ~/fish-3.7.0/fish
set -gx PATH $PATH ~/.config/nvim
set -gx PATH $PATH /home/i0i/.local/bin
set -gx PATH $PATH ~/bin
set -gx PATH $PATH /usr/local/bin
set -gx PATH $PATH /home/i0i/.cargo/bin

# LSP
set -gx PATH $PATH ~/lsp_servers/lua-language-server/bin

alias man="tldr"
alias bc="batcat"
alias py="python3"
alias pip="python3 -m pip"
alias lt="ls --level=99"
alias so="source ~/.zshrc"


alias yazi="~/yazi/yazi"
alias untar="tar xzvf"

# Tmux
alias tmd="tmux new -A -t A_default"
alias tma="tmux attach"
alias tmat="tmux attach -t"
alias tmls="tmux ls"
alias tmk="tmux kill-session -t"

alias tsj="tmux-start-job"
alias tsjd="tsj Development"
alias tsjc="tsj Console"

alias prtr='prettier --write "**/*.{js,jsx,ts,tsx,html,css,json}"'

# Nvim
alias nvim="neovim -u ~/.config/nvim/lua/main/init.lua"
alias vim="~/nvim-linux64/bin/nvim"
alias code="/mnt/c/Program\ Files/Neovide/neovide.exe --neovim-bin /opt/nvim-linux64/bin/neovim --wsl --frame none --maximized"

# Binds
bind \cf "tmux-sessionizer"
bind \cg "tmux-lazygit"

# Theme

# 1_shell
# json                                                                                                                                                                                   amro.
# clean-detailed
# amro
# kushal
# spaceship
# robbyrussell
set -x THEME robbyrussell

# oh-my-posh init fish --config ~/posh_themes/$THEME.omp.json | source
fish_config theme choose "Rosé Pine Moon"

