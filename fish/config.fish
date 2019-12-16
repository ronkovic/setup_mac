# ~/.config/fish/config.fish

## 変数
# set GOPATH $HOME/dev/go

## 環境変数
set -U fish_user_paths $HOME/flutter/bin # $fish_user_paths
set -U fish_user_paths $HOME/flutter/.pub-cache/bin $fish_user_paths
set -U fish_user_paths /usr/local/share/dotnet/dotnet $fish_user_paths
# set -U fish_user_paths $HOME/go/bin $fish_user_paths
# set -U fish_user_paths $HOME/go_appengine $fish_user_paths
# set -U fish_user_paths $HOME/google-cloud-sdk/bin $fish_user_paths

## node use
nvm use latest
