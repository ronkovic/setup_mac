#!/usr/local/bin/fish

# fish shell 設定
## fisher man インストール
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

## オートコンプリートのアップデート
fish_update_completions

## Config
cp ./config.fish ~/.config/fish/config.fish

## fish-nvm インストール
fisher add jorgebucaran/fish-nvm
nvm use lts

## fish theme Powerline
fisher add oh-my-fish/theme-bobthefish

## D2Coding Font for Powerline
git clone https://github.com/daehyeok/D2Coding-Font-for-Powerline.git ~/tmp/D2CodingFont
cp ~/tmp/D2CodingFont/*.ttf /Library/Fonts/
rm -rf ~/tmp/D2CodingFont

## Dracula
git clone https://github.com/dracula/iterm.git ~/tmp/Dracula
open ~/tmp/Dracula/Dracula.itermcolors
rm -rf ~/tmp/Dracula
