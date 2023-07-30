#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "Installing autojump"
mkdir -p ~/build
rm -rf ~/.autojump ~/build/autojump
git clone --depth 1 --single-branch https://github.com/wting/autojump.git ~/build/autojump
cd ~/build/autojump
./install.py

echo "Installing fzf"
rm -rf ~/.fzf
git clone --depth 1 --single-branch https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Installing ripgrep"
mkdir -p ~/.local/bin # Yes I deleted this accidentally while writing this script
rm -rf ~/build/ripgrep ~/.local/bin/rg
mkdir -p ~/build/ripgrep
URL=$(curl -s https://api.github.com/repos/BurntSushi/ripgrep/releases/latest |\
    grep browser_download_url | cut -d '"' -f 4 | grep -i x86_64-unknown-linux)
curl -S -L "$URL" | tar xzf - --strip-components 1 -C ~/build/ripgrep
cp ~/build/ripgrep/rg ~/.local/bin

echo "Installing lazygit"
rm -rf ~/.local/bin/lg ~/.local/bin/lazygit
URL=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest |\
    grep browser_download_url | cut -d '"' -f 4 | grep -i Linux_x86_64)
curl -s -L "$URL" | tar xzf - -C ~/.local/bin lazygit
mv ~/.local/bin/lazygit ~/.local/bin/lg

echo "Installing neovim"
mkdir -p ~/build
URL=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest |\
    grep browser_download_url | cut -d '"' -f 4 | grep -iE "linux64.tar.gz$")
curl -s -L "$URL" | tar xzf - -C ~/build
rm -rf ~/.local/bin/nvim
ln -s ~/build/nvim-linux64/bin/nvim ~/.local/bin/nvim

echo "Installing delta"
rm -rf ~/build/delta
mkdir -p ~/build/delta
URL=$(curl -s https://api.github.com/repos/dandavison/delta/releases/latest |\
    grep browser_download_url | cut -d '"' -f 4 | grep -iE "x86_64-unknown-linux-gnu.tar.gz$")
curl -S -L "$URL" | tar xzf - --strip-components 1 -C ~/build/delta
cp ~/build/delta/delta ~/.local/bin

echo "Install kitty? (y/n)"
read answer
if [[ "$answer" != "${answer#[Yy]}" ]]; then
    rm -rf ~/.local/stow
    mkdir -p ~/.local/bin ~/.local/share ~/.local/lib # Prevent stow from taking ownership of these
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin dest=~/.local/stow
    cd ~/.local/stow
    stow -vR kitty.app
    sed -i "s|Icon=kitty|Icon=/home/$USER/.local/stow/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
    sed -i "s|Exec=kitty|Exec=/home/$USER/.local/stow/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
else
    echo "Not installing kitty"
fi

echo "Install tdrop? (y/n)"
read answer
if [[ "$answer" != "${answer#[Yy]}" ]]; then
    rm -rf ~/build/tdrop
    git clone --depth 1 --single-branch https://github.com/noctuid/tdrop.git ~/build/tdrop
    cd ~/build/tdrop
    sudo make install
else
    echo "Not installing tdrop"
fi
