#!/usr/bin/env bash
set -o pipefail

section() {
    echo -e "\n\033[1;36m========================================\033[0m"
    echo -e "\033[1;36m==> $1\033[0m"
    echo -e "\033[1;36m========================================\033[0m\n"
}

section "apt update and packages"
sudo apt update && sudo apt upgrade
sudo apt install zsh tmux stow htop vim 7zip ncdu build-essential curl

section "brew installation and packages"
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo >> /home/sean/.bashrc
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' >> /home/sean/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
else
    echo "Homebrew is already installed."
fi

brew install fastfetch fzf eza fnm lazygit neovim zoxide

section "set zsh as default"
chsh -s $(which zsh)

section "git setup"
git config --global user.email "seanlinshiang@gmail.com"
git config --global user.name "Sean Lin"
echo "user.name: $(git config user.name)"
echo "user.email: $(git config user.email)"

section "fnm setup"
fnm install --lts

section "flatpak setup"
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub io.github.vikdevelop.SaveDesktop
flatpak install flathub com.mattjakeman.ExtensionManager

section "kitty terminal"
if ! command -v kitty &> /dev/null; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
    # Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
    # your system-wide PATH)
    mkdir ~/.local/bin
    ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
    # Place the kitty.desktop file somewhere it can be found by the OS
    cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
    # If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
    cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
    # Update the paths to the kitty and its icon in the kitty desktop file(s)
    sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
    sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
    # Make xdg-terminal-exec (and hence desktop environments that support it use kitty)
    echo 'kitty.desktop' > ~/.config/xdg-terminals.list
else
    echo "Kitty terminal is already installed."
fi

section "Reboot"
gnome-session-quit --reboot
