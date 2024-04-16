#!/usr/bin/env bash

fontsArr=(
  "FiraCode"
  "FiraMono"
  "JetBrainsMono"
  "Inconsolata"
  "GeistMono"
  "MPlus"
  "UbuntuMono"
  # BitstreamVeraSansMono
  # CodeNewRoman
  # DroidSansMono
  # Go-Mono
  # Hack
  # Hermit
  # Meslo
  # Noto
  # Overpass
  # ProggyClean
  # RobotoMono
  # SourceCodePro
  # SpaceMono
  # Ubuntu
)

fonts_dir="/usr/share/fonts/truetype/"

if [[ ! -d "$fonts_dir" ]]; then
    mkdir -p "$fonts_dir"
fi

latestVersion="$(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep tag_name | awk '{ print $2 }' | sed -e 's/,$//' -e 's/^"//' -e 's/"$//')"

for font in "${fontsArr[@]}"; do
  zip_file="${font}.zip"

  if [[ ! -f "$fonts_dir/$font" ]]; then
    download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/${latestVersion}/${zip_file}"
    echo "Downloading $download_url"
    wget "$download_url"
    unzip -o "$zip_file" -d "$fonts_dir"
    rm "$zip_file"
  fi
done

# clone
# git clone https://github.com/powerline/fonts.git --depth=1
git clone https://github.com/cancng/fonts.git --depth=1
# install
cd fonts
chmod +x install.sh
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

find "$fonts_dir" -name '*Windows Compatible*' -delete

fc-cache -fv

