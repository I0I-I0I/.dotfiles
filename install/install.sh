#!/bin/bash

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

create_directory() {
    local dir_path=$1
    if [ ! -d "$dir_path" ]; then
        echo "Creating directory $dir_path..."
        mkdir -p "$dir_path"
    else
        echo "Directory $dir_path already exists."
    fi
}

create_directory $HOME/apps

if command_exists dnf; then
    package_manager="dnf"
elif command_exists pacman; then
    package_manager="pacman"
else
    echo "Neither dnf nor pacman is available. Exiting."
    exit 1
fi
packages="clang lazygit atac lazysql fish stow bat fd fzf go btop"


if [ "$package_manager" == "dnf" ]; then
	sudo dnf update -y && sudo dnf upgrade -y
	sudo dnf -y install ninja-build cmake gcc make unzip gettext curl glibc-gconv-extra
	sudo dnf copr enable atim/lazygit -y
	sudo dnf copr enable joxcat/atac -y
elif [ "$package_manager" == "pacman" ]; then
	sudo pacman -Syu
	sudo pacman -S --needed git base-devel cmake unzip ninja curl yay
fi

install_dnf() {
    local package=$1
    if dnf list installed "$package" >/dev/null 2>&1; then
        echo "$package is installed. Updating..."
        sudo dnf update -y "$package"
    else
		sudo dnf install -y "$package"
		echo "$package was installed."
    fi
}

install_pacman() {
    local package=$1
    sudo pacman -Sy --needed "$package"
    echo "$package was installed."
}

install_git() {
    local repo=$1
	local path=$2
    if [ -d "$path" ]; then
        echo "Repository exists at $repo. Updating..."
        cd "$path"
        git pull origin main
    else
		echo "HI Cloning $repo to $path"
		git clone https://github.com/$repo --depth=1 "$path"
		echo "$repo was installed."
    fi
}

if [ "$package_manager" == "dnf" ]; then
    install_dnf $packages
elif [ "$package_manager" == "pacman" ]; then
    install_pacman $packages
    yay -S epy-ereader-git
fi

install_git "neovim/neovim" "$HOME/apps/neovim"
cd $HOME/apps/neovim && make CMAKE_BUILD_TYPE=Release && sudo make install

install_git "sxyazi/yazi.git" "$HOME/apps/yazi"
cd $HOME/apps/yazi && cargo build --release --locked

cd $HOME/.dotfiles
for dir in $(find . -maxdepth 1 -mindepth 0 -type d); do
	if [ "$dir" == "." ] || [ "$dir" == "./.git" ] || [ "$dir" == "./install" ] || [ "$dir" == "./walls" ]; then
		continue
	fi
    rm -fr $HOME/.config/$dir
	stow $dir
done

install_git "i0i-i0i/init.lua" "$HOME/.config/nvim"

fish
echo /usr/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/bin/fish

go install github.com/dece2183/yamusic-tui@latest
