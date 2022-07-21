# Update macOS
softwareupdate --all --install --force

# Install brew if not exists
if ! command -v brew &> /dev/null
then
   echo "Installing brew..."
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install brew apps
cd ~/.dotfiles/brew
brew bundle
brew cleanup
brew doctor

# Install AppStore apps
mas install 1037126344 # Apple Configurator
mas install 497799835 # Xcode
mas install 405399194 # Kindle
mas install 409183694 # Keynote

# Install ruby gems
sudo gem install colorls

# Install oh my zsh if not exists
if [[ ! -e ~/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install z if not exists
Z_DIR="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z"
if [[ ! -e $Z_DIR ]]; then
  git clone https://github.com/agkozak/zsh-z $Z_DIR
fi

# Install packer if not exists
if [[ ! -e ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]]; then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

# Symlink dotfiles
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/nvim ~/.config/nvim

