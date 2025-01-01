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

packages=("clang" "lazygit" "atac" "fish" "stow" "bat" "fd" "fzf")
if command_exists dnf; then
    package_manager="dnf"
elif command_exists pacman; then
    package_manager="pacman"
else
    echo "Neither dnf nor pacman is available. Exiting."
    exit 1
fi
cargo_packages=("rainfrog")


if [ "$package_manager" == "dnf" ]; then
	sudo dnf update -y
	sudo dnf -y install ninja-build cmake gcc make unzip gettext curl glibc-gconv-extra
	sudo dnf copr enable atim/lazygit -y
	sudo dnf copr enable joxcat/atac -y
elif [ "$package_manager" == "pacman" ]; then
	sudo pacman -Syu
	sudo pacman -S base-devel cmake unzip ninja curl
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
    if pacman -Qi "$package" >/dev/null 2>&1; then
        echo "$package is installed. Updating..."
        sudo pacman -Syu "$package"
    else
        sudo pacman -S "$package"
		echo "$package was installed."
    fi
}

install_cargo() {
    local package=$1
	cargo install "$package"
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

for package in "${packages[@]}"; do
    if [ "$package_manager" == "dnf" ]; then
        install_dnf "$package"
    elif [ "$package_manager" == "pacman" ]; then
        install_pacman "$package"
    fi
done

for package in "${cargo_packages[@]}"; do
    install_cargo "$package"
done

install_git "neovim/neovim" "$HOME/apps/neovim"
cd $HOME/apps/neovim && make CMAKE_BUILD_TYPE=Release && sudo make install

install_git "sxyazi/yazi.git" "$HOME/apps/yazi"
cd $HOME/apps/yazi && cargo build --release --locked

cd $HOME/.dotfiles
for dir in $(find . -maxdepth 1 -mindepth 0 -type d); do
	if [ "$dir" == "." ] || [ "$dir" == "./.git" ] || [ "$dir" == "./install" ]; then
		continue
	fi
	stow $dir
done

install_git "i0i-i0i/init.lua" "$HOME/.config/nvim"

fish
echo /usr/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/bin/fish
