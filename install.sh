#!/usr/bin/env bash

command_exists() {
  command -v "$@" >/dev/null 2>&1
}

commandsArr=(
  "unzip"
  "zsh"
  "tmux"
  "jq"
  "cowsay"
  "fortunes-br"
  "fortune"
)

for command in "${commandsArr[@]}"
do
  if ! command_exists "$command"; then
    echo "Installing $command"
    sudo apt-get install -y "$command"
  fi
done

if ! command_exists nvm; then
  echo "Installing NVM"
  curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
fi

# ohmyzsh
if ! [ -d "/root/.oh-my-zsh" ]; then
  echo "Installing OHMYZSH"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if ! [ -d "" ]; then
  echo "Installing kitty"
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  # Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in # your system-wide PATH)
  ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
  # Place the kitty.desktop file somewhere it can be found by the OS
  cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
  # If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
  cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
  # Update the paths to the kitty and its icon in the kitty.desktop file(s)
  sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
  sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
fi

if ! command_exists fc-cache; then
  apt-get install -y fontconfig
fi

if ! command_exists fzf; then
  echo "Installing fzf"
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --no-bash --no-fish --all
fi

if ! command_exists lazygit; then
  echo "Installing lazygit"
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit /usr/local/bin
fi

