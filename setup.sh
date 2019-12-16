# mac 環境設定

## スクロールバーの表示:スクロール時に表示
defaults write -g AppleShowScrollBars -string "WhenScrolling"

## Dock
### 自動的に隠さない
defaults write com.apple.dock autohide -bool true

## Mission Control:ホットコーナー
### 左下で ディスプレイをスリープ
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 0
### 右下で スクリーンセーバを開始
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0

## スリープとスクリーンセーバの解除にパスワードを要求
defaults write com.apple.screensaver askForPassword -bool true

## カーソルの移動速度を変更 （1〜15）
defaults write -g com.apple.trackpad.scaling -float 10

## 副ボタン クリック
### 右下隅に変更
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -int 0

## Finder
### 隠しファイル/フォルダを表示
defaults write com.apple.finder AppleShowAllFiles true
### パスバーを表示
defaults write com.apple.finder ShowPathbar -int 1
### ステータスバーを表示
defaults write com.apple.finder ShowStatusBar  -int 1

### 拡張子を表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

## キーボードマッピング
vid=$(ioreg -r -n 'Apple Internal Keyboard / Trackpad' | grep -E 'idVendor' | awk '{ print $4 }')
pid=$(ioreg -r -n 'Apple Internal Keyboard / Trackpad' | grep -E 'idProduct' | awk '{ print $4 }')
keyboard_id=${vid}-${pid}-0
echo ${keyboard_id}

### CapsLock -> Command
defaults -currentHost write -g com.apple.keyboard.modifiermapping.${keyboard_id} -array-add '
<dict>
  <key>HIDKeyboardModifierMappingDst</key>
  <integer>30064771299</integer>
  <key>HIDKeyboardModifierMappingSrc</key>
  <integer>30064771129</integer>
</dict>
'

# パッケージ インストール
## HomeBrew
if [ ! -x "`which brew`" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
fi

### homebrew-cask
brew cask install alfred
brew cask install clipy
brew cask install hyperswitch
brew cask install iterm2
brew cask install google-japanese-ime
brew cask install google-chrome
brew cask install visual-studio-code
brew cask install docker
brew cask install gitkraken
brew cask install station

## mas-cli
if [ ! -x "`which mas`" ]; then
  brew install mas
fi

## git
if [ ! -x "`which git`" ]; then
  brew install git
fi

## tig
if [ ! -x "`which tig`" ]; then
  brew install tig
fi

## tree
if [ ! -x "`which tree`" ]; then
  brew install tree
fi

## fish
if [ ! -x "`which fish`" ]; then
  brew install fish
fi

## yarn
if [ ! -x "`which yarn`" ]; then
  brew install yarn --ignore-dependencies
fi

## シェルをfiahに変更
sudo -S -- sh -c 'echo '/usr/local/bin/fish' >> /etc/shells'
chsh -s /usr/local/bin/fish

/usr/local/bin/fish ./fish/setup_fish.fish

## vscode setting
sh ./vscode/setup_vscode.sh

mas install 497799835 # xcode
